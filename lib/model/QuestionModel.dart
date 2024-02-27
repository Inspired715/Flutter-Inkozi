

class QuestionModel {
  CategoryInfo? categoryInfo;
  List<CategoryQuestions>? categoryQuestions;


  QuestionModel(
      {this.categoryInfo, this.categoryQuestions,});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    categoryInfo = json['category_info'] != null
        ? new CategoryInfo.fromJson(json['category_info'])
        : null;
    if (json['category_questions'] != null) {
      categoryQuestions = <CategoryQuestions>[];
      json['category_questions'].forEach((v) {
        categoryQuestions!.add(new CategoryQuestions.fromJson(v));
      });
    }
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryInfo != null) {
      data['category_info'] = this.categoryInfo!.toJson();
    }
    if (this.categoryQuestions != null) {
      data['category_questions'] =
          this.categoryQuestions!.map((v) => v.toJson()).toList();
    }
  
    return data;
  }
}

class CategoryInfo {
  String? categoryId;
  String? countryId;
  String? categoryName;

  CategoryInfo({this.categoryId, this.countryId, this.categoryName});

  CategoryInfo.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    countryId = json['country_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['country_id'] = this.countryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}

class CategoryQuestions {
  String? id;
  String? question;

  CategoryQuestions({this.id, this.question});

  CategoryQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    return data;
  }
}