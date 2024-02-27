class CategoryModel {
  String? category_id;
  String? category_name;

  CategoryModel({this.category_id, this.category_name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category_id = json['category_id'];
    category_name = json['category_name'];
  }
}
