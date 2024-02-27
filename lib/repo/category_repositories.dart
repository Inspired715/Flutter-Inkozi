import 'dart:convert';
import 'package:http/http.dart';

import '../model/CategoryModel.dart';

class CategoryRepository {
  String categoryUrl =
      'https://www.inkozi.com/api/01/categories?INKOZI-API-KEY=MG5tj4wNbrb48yFD100';

  Future<List<CategoryModel>> getCategory() async {
    print('Loaded Categories url: $categoryUrl');
    Response response = await get(Uri.parse(categoryUrl));

    print('Loaded response: $response');

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['categories'];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
