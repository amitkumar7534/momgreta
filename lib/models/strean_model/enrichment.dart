class AnalysisEnrichment {
  String? stage;
  Data? data;

  AnalysisEnrichment({this.stage, this.data});

  AnalysisEnrichment.fromJson(Map<String, dynamic> json) {
    stage = json['stage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stage'] = this.stage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalCalories;
  TotalNutrition? totalNutrition;
  MacroPercentages? macroPercentages;
  String? confidenceLevel;
  HealthTag? healthTag;

  Data(
      {this.totalCalories,
        this.totalNutrition,
        this.macroPercentages,
        this.confidenceLevel,
        this.healthTag});

  Data.fromJson(Map<String, dynamic> json) {
    totalCalories = json['total_calories'];
    totalNutrition = json['total_nutrition'] != null
        ? new TotalNutrition.fromJson(json['total_nutrition'])
        : null;
    macroPercentages = json['macro_percentages'] != null
        ? new MacroPercentages.fromJson(json['macro_percentages'])
        : null;
    confidenceLevel = json['confidenceLevel'];
    healthTag = json['health_tag'] != null
        ? new HealthTag.fromJson(json['health_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_calories'] = this.totalCalories;
    if (this.totalNutrition != null) {
      data['total_nutrition'] = this.totalNutrition!.toJson();
    }
    if (this.macroPercentages != null) {
      data['macro_percentages'] = this.macroPercentages!.toJson();
    }
    data['confidenceLevel'] = this.confidenceLevel;
    if (this.healthTag != null) {
      data['health_tag'] = this.healthTag!.toJson();
    }
    return data;
  }
}

class TotalNutrition {
  int? calories;
  double? protein;
  double? carbs;
  double? fat;

  TotalNutrition({this.calories, this.protein, this.carbs, this.fat});

  TotalNutrition.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    return data;
  }
}

class MacroPercentages {
  double? proteinPercent;
  int? carbsPercent;
  double? fatPercent;

  MacroPercentages({this.proteinPercent, this.carbsPercent, this.fatPercent});

  MacroPercentages.fromJson(Map<String, dynamic> json) {
    proteinPercent = json['protein_percent'];
    carbsPercent = json['carbs_percent'];
    fatPercent = json['fat_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protein_percent'] = this.proteinPercent;
    data['carbs_percent'] = this.carbsPercent;
    data['fat_percent'] = this.fatPercent;
    return data;
  }
}

class HealthTag {
  String? label;
  String? color;
  String? icon;
  String? iconPath;

  HealthTag({this.label, this.color, this.icon, this.iconPath});

  HealthTag.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    color = json['color'];
    icon = json['icon'];
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['color'] = this.color;
    data['icon'] = this.icon;
    data['icon_path'] = this.iconPath;
    return data;
  }
}
