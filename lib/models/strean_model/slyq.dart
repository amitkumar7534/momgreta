class SlyqStage {
  String? stage;
  Data? data;

  SlyqStage({this.stage, this.data});

  SlyqStage.fromJson(Map<String, dynamic> json) {
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
  AnalysisSummary? analysisSummary;

  Data({this.stageIndex, this.meal, this.analysisSummary});

  Data.fromJson(Map<String, dynamic> json) {
    stageIndex = json['stageIndex'];
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
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
    if (this.analysisSummary != null) {
      data['analysis_summary'] = this.analysisSummary!.toJson();
    }
    return data;
  }
}

class Meal {
  String? mealId;
  MealSlyQ? mealSlyQ;
  Rationales? rationales;
  VisualWaveParams? visualWaveParams;
  ConfidenceParts? confidenceParts;

  Meal(
      {this.mealId,
        this.mealSlyQ,
        this.rationales,
        this.visualWaveParams,
        this.confidenceParts});

  Meal.fromJson(Map<String, dynamic> json) {
    mealId = json['mealId'];
    mealSlyQ = json['mealSlyQ'] != null
        ? new MealSlyQ.fromJson(json['mealSlyQ'])
        : null;
    rationales = json['rationales'] != null
        ? new Rationales.fromJson(json['rationales'])
        : null;
    visualWaveParams = json['visualWaveParams'] != null
        ? new VisualWaveParams.fromJson(json['visualWaveParams'])
        : null;
    confidenceParts = json['confidenceParts'] != null
        ? new ConfidenceParts.fromJson(json['confidenceParts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealId'] = this.mealId;
    if (this.mealSlyQ != null) {
      data['mealSlyQ'] = this.mealSlyQ!.toJson();
    }
    if (this.rationales != null) {
      data['rationales'] = this.rationales!.toJson();
    }
    if (this.visualWaveParams != null) {
      data['visualWaveParams'] = this.visualWaveParams!.toJson();
    }
    if (this.confidenceParts != null) {
      data['confidenceParts'] = this.confidenceParts!.toJson();
    }
    return data;
  }
}

class MealSlyQ {
  int? total;
  String? band;
  int? body;
  int? mind;
  int? environment;
  int? balanceFactor;
  double? confidence;

  MealSlyQ(
      {this.total,
        this.band,
        this.body,
        this.mind,
        this.environment,
        this.balanceFactor,
        this.confidence});

  MealSlyQ.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    band = json['band'];
    body = json['body'];
    mind = json['mind'];
    environment = json['environment'];
    balanceFactor = json['balanceFactor'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['band'] = this.band;
    data['body'] = this.body;
    data['mind'] = this.mind;
    data['environment'] = this.environment;
    data['balanceFactor'] = this.balanceFactor;
    data['confidence'] = this.confidence;
    return data;
  }
}

class Rationales {
  String? body;
  String? mind;
  String? environment;
  String? scoreConfidences;

  Rationales({this.body, this.mind, this.environment, this.scoreConfidences});

  Rationales.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    mind = json['mind'];
    environment = json['environment'];
    scoreConfidences = json['scoreConfidences'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['mind'] = this.mind;
    data['environment'] = this.environment;
    data['scoreConfidences'] = this.scoreConfidences;
    return data;
  }
}

class VisualWaveParams {
  int? amplitude;
  int? frequency;
  int? thickness;
  double? glow;

  VisualWaveParams({this.amplitude, this.frequency, this.thickness, this.glow});

  VisualWaveParams.fromJson(Map<String, dynamic> json) {
    amplitude = json['amplitude'];
    frequency = json['frequency'];
    thickness = json['thickness'];
    glow = json['glow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amplitude'] = this.amplitude;
    data['frequency'] = this.frequency;
    data['thickness'] = this.thickness;
    data['glow'] = this.glow;
    return data;
  }
}

class ConfidenceParts {
  double? cB;
  double? cM;
  double? cE;

  ConfidenceParts({this.cB, this.cM, this.cE});

  ConfidenceParts.fromJson(Map<String, dynamic> json) {
    cB = json['c_B'];
    cM = json['c_M'];
    cE = json['c_E'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_B'] = this.cB;
    data['c_M'] = this.cM;
    data['c_E'] = this.cE;
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
