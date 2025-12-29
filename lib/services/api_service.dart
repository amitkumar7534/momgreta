import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:momgreta/services/urls.dart';
import '../utils/SharedPrefHelper/shared_pref_helper.dart';
import '../utils/appUtils.dart';

class ApiService {

  /// Common headers with optional Bearer token
  static Future<Map<String, String>> getHeaders({Map<String, String>? customHeaders}) async {

    String? token = await SharedPrefHelper.profile?.data?.accessToken; // fetch token from storage

    print('Bearer $token');
    return {
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      ...?customHeaders,
    };
  }

  /// GET Request
  static Future<dynamic> get(
      String endpoint,
      String baseUrl,
      {
        Map<String, String>? headers,
        Map<String, String>? queryParams,
      })
  async {
    final uri = Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);

    print('\n➡️ GET Request: ${uri.toString()}');

    try {
      final response = await http.get(
        uri,
        headers: await getHeaders(customHeaders: headers),
      );
      return _processResponse(response, uri.toString(), method: 'GET');
    } catch (e) {
      print('❌ GET Error: $e');
      rethrow;
    }
  }

  /// POST Request
  static Future<dynamic> post(
      String endpoint,
      String baseUrl,
      {
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        Map<String, String>? fields,
        Map<String, dynamic>? files, // ✅ can accept File or List<File>
        bool isMultipart = false,
      })
  async {
    final uri = Uri.parse('$baseUrl$endpoint');

    print('\n➡️ POST Request: ${uri.toString()}');
    if (body != null) print('📦 Body: $body');
    if (fields != null) print('📦 Multipart Fields: $fields');
    if (files != null) {
      files.forEach((key, value) {
        if (value is List<File>) {
          print('📎 Files for $key: ${value.map((f) => f.path).toList()}');
        } else if (value is File) {
          print('📎 File for $key: ${value.path}');
        }
      });
    }

    try {
      if (isMultipart) {
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(await getHeaders(customHeaders: headers));

        if (fields != null) {
          request.fields.addAll(fields);
        }

        if (files != null) {
          for (var entry in files.entries) {
            final key = entry.key;
            final value = entry.value;

            if (value is File) {
              // ✅ Single file
              request.files.add(
                await http.MultipartFile.fromPath(
                  key,
                  value.path,
                  contentType: _getMediaType(value.path),
                ),
              );
            } else if (value is List<File>) {
              // ✅ Multiple files
              for (var file in value) {
                request.files.add(
                  await http.MultipartFile.fromPath(
                    key,
                    file.path,
                    contentType: _getMediaType(file.path),
                  ),
                );
              }
            }
          }
        }

        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        return _processResponse(response, uri.toString(), method: 'POST (Multipart)');
      } else {
        final response = await http.post(
          uri,
          headers: await getHeaders(customHeaders: headers),
          body: jsonEncode(body),
        );
        return _processResponse(response, uri.toString(), method: 'POST');
      }
    } catch (e) {
      print('❌ POST Error: $e');
      rethrow;
    }
  }


  /// PUT Request
  static Future<dynamic> put(
      String endpoint,
      String baseUrl,
      {
        Map<String, dynamic>? body,
        Map<String, String>? headers,
      })
  async {
    final uri = Uri.parse('$baseUrl$endpoint');

    print('\n➡️ PUT Request: ${uri.toString()}');
    if (body != null) print('📦 Body: $body');

    try {
      final response = await http.put(
        uri,
        headers: await getHeaders(customHeaders: headers),
        body: jsonEncode(body),
      );
      return _processResponse(response, uri.toString(), method: 'PUT');
    } catch (e) {
      print('❌ PUT Error: $e');
      rethrow;
    }
  }

  /// DELETE Request
  static Future<dynamic> delete(
      String endpoint,
      String baseUrl,
      {
        Map<String, String>? headers,
      })
  async {
    final uri = Uri.parse('$baseUrl$endpoint');

    print('\n➡️ DELETE Request: ${uri.toString()}');

    try {
      final response = await http.delete(
        uri,
        headers: await getHeaders(customHeaders: headers),
      );
      return _processResponse(response, uri.toString(), method: 'DELETE');
    } catch (e) {
      print('❌ DELETE Error: $e');
      rethrow;
    }
  }

  /// Response handling with logs
  static dynamic _processResponse(http.Response response, String url, {String method = 'REQUEST'}) {
    print('✅ $method Response [${response.statusCode}] from $url');
    print('🔁 Response Body: ${response.body}');

    final int statusCode = response.statusCode;
    final body = response.body.isNotEmpty ? jsonDecode(response.body) : null;

    if ((statusCode >= 200 && statusCode < 300) || statusCode == 403) {
      return body;
    }
    if (statusCode == 401) {
      String errorMessage = body?['message'] ?? body?['detail'];
      AppUtils.toastError(errorMessage);

      // navState.currentState?.context.pushAndClearNavigator(LoginSignupTabs());
      SharedPrefHelper.clear();

      throw HttpException('HTTP Error: $statusCode', uri: Uri.parse(url));
    } else {
      String errorMessage = body?['message'] ?? body?['detail'];
      AppUtils.toastError(errorMessage);

      throw HttpException('HTTP Error: $statusCode', uri: Uri.parse(url));
    }
  }

  /// Detect media type
  static MediaType _getMediaType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      case 'pdf':
        return MediaType('application', 'pdf');
      case 'mp4':
        return MediaType('video', 'mp4');
      default:
        return MediaType('application', 'octet-stream');
    }
  }
}
