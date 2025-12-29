class HashtagModel {
  bool? success;
  int? count;
  List<Hashtags>? hashtags;

  HashtagModel({this.success, this.count, this.hashtags});

  HashtagModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['hashtags'] != null) {
      hashtags = <Hashtags>[];
      json['hashtags'].forEach((v) {
        hashtags!.add(new Hashtags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.hashtags != null) {
      data['hashtags'] = this.hashtags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hashtags {
  int? id;
  String? title;

  Hashtags({this.id, this.title});

  Hashtags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
