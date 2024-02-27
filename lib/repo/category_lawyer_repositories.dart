import 'dart:convert';
import 'package:http/http.dart';

import '../model/CategoryLawyerModel.dart';

class CategoryLawyerRepository {
  static const String baseUrl =
      'https://inkozi.com/api/01/category_lawyers?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&category_id=';

  Future<List<CategoryLawyerModel>> getCategoryLawyer(String categoryId) async {
    String categoryLawyerUrl = '$baseUrl$categoryId';

    try {
      print('Loaded Categories url: $categoryLawyerUrl');
      Response response = await get(Uri.parse(categoryLawyerUrl));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['attorneys'];
        return data.map((e) => CategoryLawyerModel.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
