import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/bottom_nav_bar/health.dart';
import 'package:news_app/view/bottom_nav_bar/science.dart';
import 'package:news_app/view/bottom_nav_bar/sportsPage.dart';

class HomePage extends GetWidget {
  NewsController controller = Get.put(NewsController());
  List<Widget> screens = [
    SportsPage(),
    HealthPage(),
    SciencePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: controller.currentIndex.value,
        onTap: (vale) {
          controller.currentIndex.value = vale;
        },
        items: [
          BottomNavigationBarItem(label: "Sports", icon: Icon(Icons.sports)),
          BottomNavigationBarItem(
              label: "Health", icon: Icon(Icons.health_and_safety)),
          BottomNavigationBarItem(label: "Science", icon: Icon(Icons.science)),
        ],
      ),
      body: GetX<NewsController>(
          builder: (controller) => screens[controller.currentIndex.value]),
    );
  }
}
