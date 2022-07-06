import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:praktikum_8/controllers/news_controller.dart';
import 'package:praktikum_8/views/components/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  NewsController newsController = Get.put(NewsController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        centerTitle: true,
        title: const Text("News App"),
        actions: [
          IconButton(
              onPressed: (() {
                newsController.country.value = '';
                newsController.category.value = '';
                newsController.findNews.value = '';
                newsController.cName.value = '';
                newsController.getNews(reload: true);
                newsController.update();
              }),
              icon: const Icon(Icons.refresh)),
          GetBuilder<NewsController>(
              builder: (controller) => Switch(
                    value: controller.isSwitched == true ? true : false,
                    onChanged: (value) => controller.changeTheme(value),
                    activeColor: Colors.yellow,
                    activeTrackColor: Colors.red,
                  ),
              init: NewsController())
        ],
      ),
      drawer: sideDrawer(newsController),
    );
  }
}
