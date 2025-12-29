class ContextStage {
  String? stage;
  Data? data;

  ContextStage({this.stage, this.data});

  ContextStage.fromJson(Map<String, dynamic> json) {
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
  ById? byId;
  AnalysisSummary? analysisSummary;

  Data({this.stageIndex, this.byId, this.analysisSummary});

  Data.fromJson(Map<String, dynamic> json) {
    stageIndex = json['stageIndex'];
    byId = json['byId'] != null ? new ById.fromJson(json['byId']) : null;
    analysisSummary = json['analysis_summary'] != null
        ? new AnalysisSummary.fromJson(json['analysis_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageIndex'] = this.stageIndex;
    if (this.byId != null) {
      data['byId'] = this.byId!.toJson();
    }
    if (this.analysisSummary != null) {
      data['analysis_summary'] = this.analysisSummary!.toJson();
    }
    return data;
  }
}

class ById {
  D1? d1;
  D1? d2;
  D1? d3;

  ById({this.d1, this.d2, this.d3});

  ById.fromJson(Map<String, dynamic> json) {
    d1 = json['d1'] != null ? new D1.fromJson(json['d1']) : null;
    d2 = json['d2'] != null ? new D1.fromJson(json['d2']) : null;
    d3 = json['d3'] != null ? new D1.fromJson(json['d3']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d1 != null) {
      data['d1'] = this.d1!.toJson();
    }
    if (this.d2 != null) {
      data['d2'] = this.d2!.toJson();
    }
    if (this.d3 != null) {
      data['d3'] = this.d3!.toJson();
    }
    return data;
  }
}

class D1 {
  Context? context;
  VisualCues? visualCues;

  D1({this.context, this.visualCues});

  D1.fromJson(Map<String, dynamic> json) {
    context =
    json['context'] != null ? new Context.fromJson(json['context']) : null;
    visualCues = json['visualCues'] != null
        ? new VisualCues.fromJson(json['visualCues'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    if (this.visualCues != null) {
      data['visualCues'] = this.visualCues!.toJson();
    }
    return data;
  }
}

class Context {
  String? servingContext;
  String? packagingPresence;
  String? servingMaterial;
  String? cookingMethod;
  String? beverageType;
  int? stimulantPresence;
  double? familiarityScore;
  double? culturalMatch;

  Context(
      {this.servingContext,
        this.packagingPresence,
        this.servingMaterial,
        this.cookingMethod,
        this.beverageType,
        this.stimulantPresence,
        this.familiarityScore,
        this.culturalMatch});

  Context.fromJson(Map<String, dynamic> json) {
    servingContext = json['servingContext'];
    packagingPresence = json['packagingPresence'];
    servingMaterial = json['servingMaterial'];
    cookingMethod = json['cookingMethod'];
    beverageType = json['beverageType'];
    stimulantPresence = json['stimulantPresence'];
    familiarityScore = json['familiarityScore'];
    culturalMatch = json['culturalMatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servingContext'] = this.servingContext;
    data['packagingPresence'] = this.packagingPresence;
    data['servingMaterial'] = this.servingMaterial;
    data['cookingMethod'] = this.cookingMethod;
    data['beverageType'] = this.beverageType;
    data['stimulantPresence'] = this.stimulantPresence;
    data['familiarityScore'] = this.familiarityScore;
    data['culturalMatch'] = this.culturalMatch;
    return data;
  }
}

class VisualCues {
  double? freshness;
  double? plantRatio;
  double? oiliness;
  int? char;
  int? sweetness;
  double? colorHarmony;
  double? clutter;

  VisualCues(
      {this.freshness,
        this.plantRatio,
        this.oiliness,
        this.char,
        this.sweetness,
        this.colorHarmony,
        this.clutter});

  VisualCues.fromJson(Map<String, dynamic> json) {
    freshness = json['freshness'];
    plantRatio = json['plantRatio'];
    oiliness = json['oiliness'];
    char = json['char'];
    sweetness = json['sweetness'];
    colorHarmony = json['colorHarmony'];
    clutter = json['clutter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freshness'] = this.freshness;
    data['plantRatio'] = this.plantRatio;
    data['oiliness'] = this.oiliness;
    data['char'] = this.char;
    data['sweetness'] = this.sweetness;
    data['colorHarmony'] = this.colorHarmony;
    data['clutter'] = this.clutter;
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
