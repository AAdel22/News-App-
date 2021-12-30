import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=eg&apiKey=3fe5d71299684d52ab6c50568931d80c");
  getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return articleFromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }
}
