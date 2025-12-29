class MealDishes {
  String? stage;
  Data? data;

  MealDishes({this.stage, this.data});

  MealDishes.fromJson(Map<String, dynamic> json) {
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
  String? schemaVersion;
  int? stageIndex;
  int? totalStages;
  Meal? meal;
  List<Dishes>? dishes;
  Ids? ids;
  double? imageConfidence;
  int? totalCalories;
  TotalNutrition? totalNutrition;
  MacroPercentages? macroPercentages;
  String? confidenceLevel;
  HealthTag? healthTag;

  Data(
      {this.schemaVersion,
        this.stageIndex,
        this.totalStages,
        this.meal,
        this.dishes,
        this.ids,
        this.imageConfidence,
        this.totalCalories,
        this.totalNutrition,
        this.macroPercentages,
        this.confidenceLevel,
        this.healthTag});

  Data.fromJson(Map<String, dynamic> json) {
    schemaVersion = json['schemaVersion'];
    stageIndex = json['stageIndex'];
    totalStages = json['totalStages'];
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(new Dishes.fromJson(v));
      });
    }
    ids = json['ids'] != null ? new Ids.fromJson(json['ids']) : null;
    imageConfidence = json['imageConfidence'];
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
    data['schemaVersion'] = this.schemaVersion;
    data['stageIndex'] = this.stageIndex;
    data['totalStages'] = this.totalStages;
    if (this.meal != null) {
      data['meal'] = this.meal!.toJson();
    }
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.map((v) => v.toJson()).toList();
    }
    if (this.ids != null) {
      data['ids'] = this.ids!.toJson();
    }
    data['imageConfidence'] = this.imageConfidence;
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

class Meal {
  String? mealId;
  MealName? mealName;
  String? mealType;

  Meal({this.mealId, this.mealName, this.mealType});

  Meal.fromJson(Map<String, dynamic> json) {
    mealId = json['mealId'];
    mealName = json['mealName'] != null
        ? new MealName.fromJson(json['mealName'])
        : null;
    mealType = json['mealType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealId'] = this.mealId;
    if (this.mealName != null) {
      data['mealName'] = this.mealName!.toJson();
    }
    data['mealType'] = this.mealType;
    return data;
  }
}

class MealName {
  String? value;
  double? c;

  MealName({this.value, this.c});

  MealName.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['c'] = this.c;
    return data;
  }
}

class Dishes {
  String? id;
  String? dishType;
  bool? isMain;
  MealName? dishName;
  MealName? dishClass;
  Region? region;

  Dishes(
      {this.id,
        this.dishType,
        this.isMain,
        this.dishName,
        this.dishClass,
        this.region});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishType = json['dishType'];
    isMain = json['isMain'];
    dishName = json['dishName'] != null
        ? new MealName.fromJson(json['dishName'])
        : null;
    dishClass = json['dishClass'] != null
        ? new MealName.fromJson(json['dishClass'])
        : null;
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dishType'] = this.dishType;
    data['isMain'] = this.isMain;
    if (this.dishName != null) {
      data['dishName'] = this.dishName!.toJson();
    }
    if (this.dishClass != null) {
      data['dishClass'] = this.dishClass!.toJson();
    }
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Region {
  double? x;
  double? y;
  double? w;
  double? h;

  Region({this.x, this.y, this.w, this.h});

  Region.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    w = json['w'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['w'] = this.w;
    data['h'] = this.h;
    return data;
  }
}

class Ids {
  String? meal;
  List<String>? dishes;

  Ids({this.meal, this.dishes});

  Ids.fromJson(Map<String, dynamic> json) {
    meal = json['meal'];
    dishes = json['dishes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meal'] = this.meal;
    data['dishes'] = this.dishes;
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
