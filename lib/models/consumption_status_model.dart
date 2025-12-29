class ConsumptionStatusModel {
  bool? success;
  String? userId;
  Today? yesterday;
  Today? today;
  Changes? changes;
  Summary? summary;

  ConsumptionStatusModel(
      {this.success,
        this.userId,
        this.yesterday,
        this.today,
        this.changes,
        this.summary});

  ConsumptionStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['userId'];
    yesterday = json['yesterday'] != null
        ? new Today.fromJson(json['yesterday'])
        : null;
    today = json['today'] != null ? new Today.fromJson(json['today']) : null;
    changes =
    json['changes'] != null ? new Changes.fromJson(json['changes']) : null;
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userId'] = this.userId;
    if (this.yesterday != null) {
      data['yesterday'] = this.yesterday!.toJson();
    }
    if (this.today != null) {
      data['today'] = this.today!.toJson();
    }
    if (this.changes != null) {
      data['changes'] = this.changes!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}


class Today {
  String? date;
  List<MealData>? meals;
  dynamic totalCalories;
  dynamic totalProtein;
  dynamic totalCarbs;
  dynamic totalFat;
  dynamic mealCount;
  dynamic healthScore;
  HealthTagCounts? healthTagCounts;

  Today(
      {this.date,
        this.meals,
        this.totalCalories,
        this.totalProtein,
        this.totalCarbs,
        this.totalFat,
        this.mealCount,
        this.healthScore,
        this.healthTagCounts,
      });

  Today.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['meals'] != null) {
      meals = <MealData>[];
      json['meals'].forEach((v) {
        meals!.add(new MealData.fromJson(v));
      });
    }
    totalCalories = json['totalCalories'];
    totalProtein = json['totalProtein'];
    totalCarbs = json['totalCarbs'];
    totalFat = json['totalFat'];
    mealCount = json['mealCount'];
    healthScore = json['healthScore'];
    healthTagCounts = json['healthTagCounts'] != null
        ? new HealthTagCounts.fromJson(json['healthTagCounts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    data['totalCalories'] = this.totalCalories;
    data['totalProtein'] = this.totalProtein;
    data['totalCarbs'] = this.totalCarbs;
    data['totalFat'] = this.totalFat;
    data['mealCount'] = this.mealCount;
    data['healthScore'] = this.healthScore;
    if (this.healthTagCounts != null) {
      data['healthTagCounts'] = this.healthTagCounts!.toJson();
    }

    return data;
  }
}

class HealthTagCounts {
  int? light;
  int? balanced;
  int? heavy;

  HealthTagCounts({this.light, this.balanced, this.heavy});

  HealthTagCounts.fromJson(Map<String, dynamic> json) {
    light = json['light'];
    balanced = json['balanced'];
    heavy = json['heavy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['light'] = this.light;
    data['balanced'] = this.balanced;
    data['heavy'] = this.heavy;
    return data;
  }
}


class MealData {
  String? id;
  String? name;
  String? image;
  String? time;
  dynamic calories;
  dynamic protein;
  dynamic carbs;
  dynamic fat;
  List<Null>? ingredients;

  MealData(
      {this.id,
        this.name,
        this.image,
        this.time,
        this.calories,
        this.protein,
        this.carbs,
        this.fat,
        this.ingredients});

  MealData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    time = json['time'];
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['time'] = this.time;
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    return data;
  }
}

class Changes {
  Calories? calories;
  Calories? protein;
  Calories? carbs;
  Calories? fat;
  HealthScore? healthScore;
  HealthScore? mealCount;

  Changes(
      {this.calories,
        this.protein,
        this.carbs,
        this.fat,
        this.healthScore,
        this.mealCount});

  Changes.fromJson(Map<String, dynamic> json) {
    calories = json['calories'] != null
        ? new Calories.fromJson(json['calories'])
        : null;
    protein =
    json['protein'] != null ? new Calories.fromJson(json['protein']) : null;
    carbs = json['carbs'] != null ? new Calories.fromJson(json['carbs']) : null;
    fat = json['fat'] != null ? new Calories.fromJson(json['fat']) : null;
    healthScore = json['healthScore'] != null
        ? new HealthScore.fromJson(json['healthScore'])
        : null;
    mealCount = json['mealCount'] != null
        ? new HealthScore.fromJson(json['mealCount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calories != null) {
      data['calories'] = this.calories!.toJson();
    }
    if (this.protein != null) {
      data['protein'] = this.protein!.toJson();
    }
    if (this.carbs != null) {
      data['carbs'] = this.carbs!.toJson();
    }
    if (this.fat != null) {
      data['fat'] = this.fat!.toJson();
    }
    if (this.healthScore != null) {
      data['healthScore'] = this.healthScore!.toJson();
    }
    if (this.mealCount != null) {
      data['mealCount'] = this.mealCount!.toJson();
    }
    return data;
  }
}

class Calories {
  dynamic absolute;
  dynamic percentage;

  Calories({this.absolute, this.percentage});

  Calories.fromJson(Map<String, dynamic> json) {
    absolute = json['absolute'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absolute'] = this.absolute;
    data['percentage'] = this.percentage;
    return data;
  }
}

class HealthScore {
  dynamic absolute;

  HealthScore({this.absolute});

  HealthScore.fromJson(Map<String, dynamic> json) {
    absolute = json['absolute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absolute'] = this.absolute;
    return data;
  }
}

class Summary {
  String? overallTrend;
  String? consistency;

  Summary({this.overallTrend, this.consistency});

  Summary.fromJson(Map<String, dynamic> json) {
    overallTrend = json['overallTrend'];
    consistency = json['consistency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overallTrend'] = this.overallTrend;
    data['consistency'] = this.consistency;
    return data;
  }
}
