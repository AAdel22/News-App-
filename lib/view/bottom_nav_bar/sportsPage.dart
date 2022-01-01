import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

class SportsPage extends GetWidget {
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: FutureBuilder(
        future: controller.getData("sports"),
        builder: (context, AsyncSnapshot snapShot) {
          Article data = snapShot.data;
          if (snapShot.hasData) {
            return ListView.builder(
                itemCount: data.articles.length,
                itemBuilder: (context, int index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: Image.network(
                            data.articles[index].urlToImage.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          data.articles[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          data.articles[index].description,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
