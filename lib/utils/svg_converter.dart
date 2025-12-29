import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SafeSvgNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const SafeSvgNetwork({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  Future<String> _loadAndFixSvg() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String svgData = response.body;

      // ✅ Remove problematic % units and extra spaces
      svgData = svgData
          .replaceAll('100%', '100')
          .replaceAll('%', '')
          .replaceAll('px', '')
          .replaceAll(RegExp(r'[\r\n]+'), ' ');

      return svgData;
    } else {
      throw Exception('Failed to load SVG from $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadAndFixSvg(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Icon(Icons.error, color: Colors.red);
        }

        // ✅ Load cleaned SVG string safely
        return SvgPicture.string(
          snapshot.data!,
          width: width,
          height: height,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
