class IngredientsStage {
  String? stage;
  Data? data;

  IngredientsStage({this.stage, this.data});

  IngredientsStage.fromJson(Map<String, dynamic> json) {
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

  Data({this.stageIndex, this.byId});

  Data.fromJson(Map<String, dynamic> json) {
    stageIndex = json['stageIndex'];
    byId = json['byId'] != null ? new ById.fromJson(json['byId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageIndex'] = this.stageIndex;
    if (this.byId != null) {
      data['byId'] = this.byId!.toJson();
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
  List<Ingredients>? ingredients;

  D1({this.ingredients});

  D1.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  int? amountEstimateG;
  String? originRegion;
  String? originCountry;
  bool? isAnimal;
  String? animalType;
  bool? isProcessed;

  Ingredients(
      {this.name,
        this.amountEstimateG,
        this.originRegion,
        this.originCountry,
        this.isAnimal,
        this.animalType,
        this.isProcessed});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amountEstimateG = json['amount_estimate_g'];
    originRegion = json['origin_region'];
    originCountry = json['origin_country'];
    isAnimal = json['is_animal'];
    animalType = json['animal_type'];
    isProcessed = json['is_processed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount_estimate_g'] = this.amountEstimateG;
    data['origin_region'] = this.originRegion;
    data['origin_country'] = this.originCountry;
    data['is_animal'] = this.isAnimal;
    data['animal_type'] = this.animalType;
    data['is_processed'] = this.isProcessed;
    return data;
  }
}
