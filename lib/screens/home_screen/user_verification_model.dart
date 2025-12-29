class UserVerificationResponse {
  int? statusCode;
  bool? success;
  String? message;
  UserData? data;

  UserVerificationResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  UserVerificationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
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

class UserData {
  String? id;
  String? email;
  String? name;
  String? password;
  String? role;
  String? pin;
  String? relation;
  List<UserChild>? children;
  bool? notificationOn;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserData({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.pin,
    this.relation,
    this.children,
    this.notificationOn,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    role = json['role'];
    pin = json['pin'];
    relation = json['relation'];
    notificationOn = json['notificationOn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];

    if (json['children'] != null) {
      children = (json['children'] as List)
          .map((e) => UserChild.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'name': name,
      'password': password,
      'role': role,
      'pin': pin,
      'relation': relation,
      'children': children?.map((e) => e.toJson()).toList(),
      'notificationOn': notificationOn,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class UserChild {
  String? id;
  String? name;

  UserChild({
    this.id,
    this.name,
  });

  UserChild.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}