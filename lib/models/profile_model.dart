class ProfileModel {
  String? id;
  String? email;
  String? name;
  String? displayName;
  String? bio;
  List<String>? dietaryPreferences;
  List<String>? allergies;
  dynamic healthGoals;
  String? createdAt;
  int? streakDays;
  int? total_meals;

  ProfileModel(
      {this.id,
        this.email,
        this.name,
        this.displayName,
        this.bio,
        this.dietaryPreferences,
        this.allergies,
        this.healthGoals,
        this.createdAt,
        this.streakDays,
        this.total_meals,
      });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    displayName = json['display_name'];
    bio = json['bio'];
    dietaryPreferences = (json['dietary_preferences'] != null)
        ? List<String>.from(json['dietary_preferences'])
        : [];

    allergies = (json['allergies'] != null)
        ? List<String>.from(json['allergies'])
        : [];

    healthGoals = json['health_goals'];
    createdAt = json['created_at'];
    streakDays = json['streakDays'];
    total_meals = json['total_meals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['bio'] = this.bio;
    data['dietary_preferences'] = this.dietaryPreferences;
    data['allergies'] = this.allergies;
    data['health_goals'] = this.healthGoals;
    data['created_at'] = this.createdAt;
    data['streakDays'] = this.streakDays;
    data['total_meals'] = this.total_meals;
    return data;
  }
}
