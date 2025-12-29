class NutritionStage {
  String? stage;
  Data? data;

  NutritionStage({this.stage, this.data});

  NutritionStage.fromJson(Map<String, dynamic> json) {
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
  int? stageIndex;
  Meal? meal;
  bool? coarse;
  AnalysisSummary? analysisSummary;

  Data({this.stageIndex, this.meal, this.coarse, this.analysisSummary});

  Data.fromJson(Map<String, dynamic> json) {
    stageIndex = json['stageIndex'];
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
    coarse = json['coarse'];
    analysisSummary = json['analysis_summary'] != null
        ? new AnalysisSummary.fromJson(json['analysis_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageIndex'] = this.stageIndex;
    if (this.meal != null) {
      data['meal'] = this.meal!.toJson();
    }
    data['coarse'] = this.coarse;
    if (this.analysisSummary != null) {
      data['analysis_summary'] = this.analysisSummary!.toJson();
    }
    return data;
  }
}

class Meal {
  String? mealId;
  Nutrition? nutrition;
  String? aggregation;

  Meal({this.mealId, this.nutrition, this.aggregation});

  Meal.fromJson(Map<String, dynamic> json) {
    mealId = json['mealId'];
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    aggregation = json['aggregation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealId'] = this.mealId;
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition!.toJson();
    }
    data['aggregation'] = this.aggregation;
    return data;
  }
}

class Nutrition {
  int? servingMassG;
  int? energyKcal;
  double? proteinG;
  double? carbsG;
  double? fiberG;
  int? addedSugarG;
  double? fatG;
  double? satFatG;
  int? transFatG;
  int? sodiumMg;

  Nutrition(
      {this.servingMassG,
        this.energyKcal,
        this.proteinG,
        this.carbsG,
        this.fiberG,
        this.addedSugarG,
        this.fatG,
        this.satFatG,
        this.transFatG,
        this.sodiumMg});

  Nutrition.fromJson(Map<String, dynamic> json) {
    servingMassG = json['serving_mass_g'];
    energyKcal = json['energy_kcal'];
    proteinG = json['protein_g'];
    carbsG = json['carbs_g'];
    fiberG = json['fiber_g'];
    addedSugarG = json['added_sugar_g'];
    fatG = json['fat_g'];
    satFatG = json['sat_fat_g'];
    transFatG = json['trans_fat_g'];
    sodiumMg = json['sodium_mg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serving_mass_g'] = this.servingMassG;
    data['energy_kcal'] = this.energyKcal;
    data['protein_g'] = this.proteinG;
    data['carbs_g'] = this.carbsG;
    data['fiber_g'] = this.fiberG;
    data['added_sugar_g'] = this.addedSugarG;
    data['fat_g'] = this.fatG;
    data['sat_fat_g'] = this.satFatG;
    data['trans_fat_g'] = this.transFatG;
    data['sodium_mg'] = this.sodiumMg;
    return data;
  }
}

class AnalysisSummary {
  int? totalCalories;
  TotalNutrition? totalNutrition;
  MacroPercentages? macroPercentages;
  String? confidenceLevel;
  HealthTag? healthTag;

  AnalysisSummary(
      {this.totalCalories,
        this.totalNutrition,
        this.macroPercentages,
        this.confidenceLevel,
        this.healthTag});

  AnalysisSummary.fromJson(Map<String, dynamic> json) {
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
