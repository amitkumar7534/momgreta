class DietaryPreferencesModel {
  bool? success;
  List<String>? dietaryPreferences;

  DietaryPreferencesModel({this.success, this.dietaryPreferences});

  DietaryPreferencesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dietaryPreferences = json['dietaryPreferences'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['dietaryPreferences'] = this.dietaryPreferences;
    return data;
  }
}
