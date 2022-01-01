import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(String cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=3fe5d71299684d52ab6c50568931d80c");
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
