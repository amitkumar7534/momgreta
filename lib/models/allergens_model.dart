class AllergensModel {
  bool? success;
  List<String>? allergens;

  AllergensModel({this.success, this.allergens});

  AllergensModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    allergens = json['allergens'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['allergens'] = this.allergens;
    return data;
  }
}
