class AttendanceHistoryResponse {
  int? statusCode;
  bool? success;
  String? message;
  AttendanceData? data;

  AttendanceHistoryResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  AttendanceHistoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? AttendanceData.fromJson(json['data'])
        : null;
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

class AttendanceData {
  int? page;
  int? limit;
  int? total;
  int? totalPages;
  List<AttendanceItem>? data;

  AttendanceData({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
    this.data,
  });

  AttendanceData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPages = json['totalPages'];

    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((e) => AttendanceItem.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPages': totalPages,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class AttendanceItem {
  String? id;
  AttendanceUser? user;
  String? type;
  String? actionAt;
  List<AttendanceChild>? children;

  AttendanceItem({
    this.id,
    this.user,
    this.type,
    this.actionAt,
    this.children,
  });

  AttendanceItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    actionAt = json['actionAt'];

    user = json['user'] != null
        ? AttendanceUser.fromJson(json['user'])
        : null;

    if (json['children'] != null) {
      children = (json['children'] as List)
          .map((e) => AttendanceChild.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user?.toJson(),
      'type': type,
      'actionAt': actionAt,
      'children': children?.map((e) => e.toJson()).toList(),
    };
  }
}

class AttendanceUser {
  String? id;
  String? email;
  String? name;
  String? role;
  String? relation;

  AttendanceUser({
    this.id,
    this.email,
    this.name,
    this.role,
    this.relation,
  });

  AttendanceUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'name': name,
      'role': role,
      'relation': relation,
    };
  }
}

class AttendanceChild {
  String? id;
  String? name;

  AttendanceChild({
    this.id,
    this.name,
  });

  AttendanceChild.fromJson(Map<String, dynamic> json) {
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
