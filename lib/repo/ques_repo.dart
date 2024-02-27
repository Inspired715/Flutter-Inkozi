import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:inkozi/model/QuestionModel.dart';

class QuestionRepository {
  static const String baseUrl =
      'https://www.inkozi.com/api/01/category_detail?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&category_id=';

  Future<QuestionModel> getCategoryQuestions(int categoryId) async {
    String categoryQuestionsUrl = '$baseUrl$categoryId';

    try {
      Response response = await get(Uri.parse(categoryQuestionsUrl));
      log("response.statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return QuestionModel.fromJson(data);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
