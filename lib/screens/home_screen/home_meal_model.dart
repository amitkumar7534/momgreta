class HomeMealModel {
  bool? success;
  List<Meals>? meals;

  HomeMealModel({this.success, this.meals});

  HomeMealModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? id;
  String? userId;
  String? name;
  String? overallDishName;
  String? origin;
  String? details;
  dynamic calories;
  dynamic protein;
  dynamic carbs;
  dynamic fat;
  List<String>? ingredients;
  List<String>? cookingMethods;
  HealthTag? healthTag;
  String? confidence;
  List<Dishes>? dishes;
  String? mainDish;
  List<String>? dietary;
  dynamic portionSize;
  String? portionUnit;
  bool? isPublic;
  String? analysisMethod;
  dynamic dishCount;
  String? mealTime;
  String? mealType;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  List<String>? allergens;
  MacroPercentages? macroPercentages;

  Meals(
      {this.id,
        this.userId,
        this.name,
        this.overallDishName,
        this.origin,
        this.details,
        this.calories,
        this.protein,
        this.carbs,
        this.fat,
        this.ingredients,
        this.cookingMethods,
        this.healthTag,
        this.confidence,
        this.dishes,
        this.mainDish,
        this.dietary,
        this.portionSize,
        this.portionUnit,
        this.isPublic,
        this.analysisMethod,
        this.dishCount,
        this.mealTime,
        this.mealType,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.macroPercentages,
        this.allergens});

  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    overallDishName = json['overallDishName'];
    origin = json['origin'];
    details = json['details'];
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fat = json['fat'];
    ingredients = json['ingredients'].cast<String>();
    cookingMethods = json['cookingMethods'].cast<String>();
    healthTag = json['healthTag'] != null
        ? new HealthTag.fromJson(json['healthTag'])
        : null;
    confidence = json['confidence'];
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(new Dishes.fromJson(v));
      });
    }
    mainDish = json['mainDish'];
    dietary = json['dietary'].cast<String>();
    portionSize = json['portionSize'];
    portionUnit = json['portionUnit'];
    isPublic = json['isPublic'];
    analysisMethod = json['analysisMethod'];
    dishCount = json['dishCount'];
    mealTime = json['mealTime'];
    mealType = json['mealType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageUrl = json['imageUrl'];
    allergens = json['allergens'].cast<String>();
    macroPercentages = json['macroPercentages'] != null
        ? new MacroPercentages.fromJson(json['macroPercentages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['overallDishName'] = this.overallDishName;
    data['origin'] = this.origin;
    data['details'] = this.details;
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    data['ingredients'] = this.ingredients;
    data['cookingMethods'] = this.cookingMethods;
    if (this.healthTag != null) {
      data['healthTag'] = this.healthTag!.toJson();
    }
    data['confidence'] = this.confidence;
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.map((v) => v.toJson()).toList();
    }
    data['mainDish'] = this.mainDish;
    data['dietary'] = this.dietary;
    data['portionSize'] = this.portionSize;
    data['portionUnit'] = this.portionUnit;
    data['isPublic'] = this.isPublic;
    data['analysisMethod'] = this.analysisMethod;
    data['dishCount'] = this.dishCount;
    data['mealTime'] = this.mealTime;
    data['mealType'] = this.mealType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['imageUrl'] = this.imageUrl;
    data['allergens'] = this.allergens;
    if (this.macroPercentages != null) {
      data['macroPercentages'] = this.macroPercentages!.toJson();
    }
    return data;
  }
}

class HealthTag {
  String? label;
  String? color;
  String? icon;

  HealthTag({this.label, this.color, this.icon});

  HealthTag.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    color = json['color'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['color'] = this.color;
    data['icon'] = this.icon;
    return data;
  }
}

class Dishes {
  String? name;
  bool? isMain;
  String? category;
  String? origin;
  String? details;
  Portion? portion;
  List<String>? cookingMethods;
  List<Ingredients>? ingredients;
  NutritionPerServing? nutritionPerServing;
  List<String>? dietary;
  List<String>? commonAllergens;
  bool showDishBreakdown = false;

  Dishes(
      {this.name,
        this.isMain,
        this.category,
        this.origin,
        this.details,
        this.portion,
        this.cookingMethods,
        this.ingredients,
        this.nutritionPerServing,
        this.dietary,
        this.commonAllergens});

  Dishes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isMain = json['isMain'];
    category = json['category'];
    origin = json['origin'];
    details = json['details'];
    portion =
    json['portion'] != null ? new Portion.fromJson(json['portion']) : null;
    cookingMethods = json['cookingMethods'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    nutritionPerServing = json['nutritionPerServing'] != null
        ? new NutritionPerServing.fromJson(json['nutritionPerServing'])
        : null;
    dietary = json['dietary'].cast<String>();
    commonAllergens = json['commonAllergens'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isMain'] = this.isMain;
    data['category'] = this.category;
    data['origin'] = this.origin;
    data['details'] = this.details;
    if (this.portion != null) {
      data['portion'] = this.portion!.toJson();
    }
    data['cookingMethods'] = this.cookingMethods;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.nutritionPerServing != null) {
      data['nutritionPerServing'] = this.nutritionPerServing!.toJson();
    }
    data['dietary'] = this.dietary;
    data['commonAllergens'] = this.commonAllergens;
    return data;
  }
}

class Portion {
  String? unit;
  dynamic quantity;
  String? notes;

  Portion({this.unit, this.quantity, this.notes});

  Portion.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    quantity = json['quantity'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['notes'] = this.notes;
    return data;
  }
}

class Ingredients {
  String? name;
  dynamic quantityEstimateGrams;
  String? notes;
  double? confidence;

  Ingredients(
      {this.name, this.quantityEstimateGrams, this.notes, this.confidence});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantityEstimateGrams = json['quantityEstimateGrams'];
    notes = json['notes'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantityEstimateGrams'] = this.quantityEstimateGrams;
    data['notes'] = this.notes;
    data['confidence'] = this.confidence;
    return data;
  }
}

class NutritionPerServing {
  dynamic caloriesKcal;
  MacrosGrams? macrosGrams;

  NutritionPerServing({this.caloriesKcal, this.macrosGrams});

  NutritionPerServing.fromJson(Map<String, dynamic> json) {
    caloriesKcal = json['caloriesKcal'];
    macrosGrams = json['macrosGrams'] != null
        ? new MacrosGrams.fromJson(json['macrosGrams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caloriesKcal'] = this.caloriesKcal;
    if (this.macrosGrams != null) {
      data['macrosGrams'] = this.macrosGrams!.toJson();
    }
    return data;
  }
}

class MacrosGrams {
  dynamic carbs;
  dynamic protein;
  dynamic fat;

  MacrosGrams({this.carbs, this.protein, this.fat});

  MacrosGrams.fromJson(Map<String, dynamic> json) {
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carbs'] = this.carbs;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    return data;
  }
}

class MacroPercentages {
  dynamic proteinPercent;
  dynamic carbsPercent;
  dynamic fatPercent;

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
