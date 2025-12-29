class LoginModel {
  int? statusCode;
  bool? success;
  String? message;
  LoginData? data;

  LoginModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class LoginData {
  String? accessToken;
  Admin? admin;

  LoginData({
    this.accessToken,
    this.admin,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'admin': admin?.toJson(),
    };
  }
}

class Admin {
  String? id;
  String? email;
  String? password;
  String? image;
  String? role;
  bool? isActive;
  String? passwordChangedAt;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? fullName;
  String? phone;

  Admin({
    this.id,
    this.email,
    this.password,
    this.image,
    this.role,
    this.isActive,
    this.passwordChangedAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fullName,
    this.phone,
  });

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    role = json['role'];
    isActive = json['isActive'];
    passwordChangedAt = json['passwordChangedAt'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    fullName = json['fullName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'image': image,
      'role': role,
      'isActive': isActive,
      'passwordChangedAt': passwordChangedAt,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'fullName': fullName,
      'phone': phone,
    };
  }
}