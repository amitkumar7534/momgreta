class MealDetail {
  bool? success;
  Meal? meal;

  MealDetail({this.success, this.meal});

  MealDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.meal != null) {
      data['meal'] = this.meal!.toJson();
    }
    return data;
  }
}

class Meal {
  dynamic id;
  dynamic userId;
  dynamic name;
  Null? overallDishName;
  dynamic origin;
  Cuisine? cuisine;
  Cuisine? category;
  dynamic details;
  dynamic description;
  dynamic funFact;
  Nutrition? nutrition;
  MacroPercentages? macroPercentages;
  List<Ingredients>? ingredients;
  List<Cuisine>? cookingMethods;
  HealthTag? healthTag;
  dynamic confidence;
  List<Dishes>? dishes;
  Null? mainDish;
  List<Cuisine>? dietary;
  List<Cuisine>? allergens;
  Null? portionUnit;
  bool? isPublic;
  dynamic analysisMethod;
  dynamic dishCount;
  dynamic mealTime;
  dynamic mealType;
  dynamic mealTypeIconPath;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic caption;
  Null? latitude;
  Null? longitude;
  Null? businessName;
  Null? businessAddress;
  dynamic imageUrl;

  Meal(
      {this.id,
        this.userId,
        this.name,
        this.overallDishName,
        this.origin,
        this.cuisine,
        this.category,
        this.details,
        this.description,
        this.funFact,
        this.nutrition,
        this.macroPercentages,
        this.ingredients,
        this.cookingMethods,
        this.healthTag,
        this.confidence,
        this.dishes,
        this.mainDish,
        this.dietary,
        this.allergens,
        this.portionUnit,
        this.isPublic,
        this.analysisMethod,
        this.dishCount,
        this.mealTime,
        this.mealType,
        this.mealTypeIconPath,
        this.createdAt,
        this.updatedAt,
        this.caption,
        this.latitude,
        this.longitude,
        this.businessName,
        this.businessAddress,
        this.imageUrl});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    overallDishName = json['overallDishName'];
    origin = json['origin'];
    cuisine =
    json['cuisine'] != null ? new Cuisine.fromJson(json['cuisine']) : null;
    category = json['category'] != null
        ? new Cuisine.fromJson(json['category'])
        : null;
    details = json['details'];
    description = json['description'];
    funFact = json['funFact'];
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    macroPercentages = json['macroPercentages'] != null
        ? new MacroPercentages.fromJson(json['macroPercentages'])
        : null;
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    if (json['cookingMethods'] != null) {
      cookingMethods = <Cuisine>[];
      json['cookingMethods'].forEach((v) {
        cookingMethods!.add(new Cuisine.fromJson(v));
      });
    }
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
   
    if (json['dietary'] != null) {
      dietary = <Cuisine>[];
      json['dietary'].forEach((v) {
        dietary!.add(new Cuisine.fromJson(v));
      });
    }
    if (json['allergens'] != null) {
      allergens = <Cuisine>[];
      json['allergens'].forEach((v) {
        allergens!.add(new Cuisine.fromJson(v));
      });
    }
    portionUnit = json['portionUnit'];
    isPublic = json['isPublic'];
    analysisMethod = json['analysisMethod'];
    dishCount = json['dishCount'];
    mealTime = json['mealTime'];
    mealType = json['mealType'];
    mealTypeIconPath = json['mealTypeIconPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    caption = json['caption'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    businessName = json['businessName'];
    businessAddress = json['businessAddress'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['overallDishName'] = this.overallDishName;
    data['origin'] = this.origin;
    if (this.cuisine != null) {
      data['cuisine'] = this.cuisine!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['details'] = this.details;
    data['description'] = this.description;
    data['funFact'] = this.funFact;
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition!.toJson();
    }
    if (this.macroPercentages != null) {
      data['macroPercentages'] = this.macroPercentages!.toJson();
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.cookingMethods != null) {
      data['cookingMethods'] =
          this.cookingMethods!.map((v) => v.toJson()).toList();
    }
    if (this.healthTag != null) {
      data['healthTag'] = this.healthTag!.toJson();
    }
    data['confidence'] = this.confidence;
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.map((v) => v.toJson()).toList();
    }
    data['mainDish'] = this.mainDish;
    
    if (this.dietary != null) {
      data['dietary'] = this.dietary!.map((v) => v.toJson()).toList();
    }
    if (this.allergens != null) {
      data['allergens'] = this.allergens!.map((v) => v.toJson()).toList();
    }
    data['portionUnit'] = this.portionUnit;
    data['isPublic'] = this.isPublic;
    data['analysisMethod'] = this.analysisMethod;
    data['dishCount'] = this.dishCount;
    data['mealTime'] = this.mealTime;
    data['mealType'] = this.mealType;
    data['mealTypeIconPath'] = this.mealTypeIconPath;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['caption'] = this.caption;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['businessName'] = this.businessName;
    data['businessAddress'] = this.businessAddress;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Cuisine {
  dynamic name;
  dynamic iconPath;

  Cuisine({this.name, this.iconPath});

  Cuisine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon_path'] = this.iconPath;
    return data;
  }
}

class Nutrition {
  dynamic calories;
  dynamic protein;
  dynamic carbs;
  dynamic fat;

  Nutrition({this.calories, this.protein, this.carbs, this.fat});

  Nutrition.fromJson(Map<String, dynamic> json) {
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

class Ingredients {
  dynamic name;
  dynamic quantityEstimateGrams;
  dynamic notes;
  dynamic confidence;

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

class HealthTag {
  dynamic label;
  dynamic color;
  dynamic icon;
  dynamic iconPath;

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

class Dishes {
  dynamic name;
  bool? isMain;
  bool showDishBreakdown = false;
  dynamic category;
  dynamic origin;
  dynamic details;
  RestaurantBrand? restaurantBrand;
  Portion? portion;
  List<String>? cookingMethods;
  List<Ingredients>? ingredients;
  NutritionPerServing? nutritionPerServing;
  List<String>? dietary;
  List<String>? commonAllergens;

  Dishes(
      {this.name,
        this.isMain,
        this.category,
        this.origin,
        this.details,
        this.restaurantBrand,
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
    restaurantBrand = json['restaurantBrand'] != null
        ? new RestaurantBrand.fromJson(json['restaurantBrand'])
        : null;
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
    if (this.restaurantBrand != null) {
      data['restaurantBrand'] = this.restaurantBrand!.toJson();
    }
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

class RestaurantBrand {
  dynamic name;
  dynamic confidence;

  RestaurantBrand({this.name, this.confidence});

  RestaurantBrand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['confidence'] = this.confidence;
    return data;
  }
}

class Portion {
  dynamic unit;
  dynamic quantity;
  dynamic notes;

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
