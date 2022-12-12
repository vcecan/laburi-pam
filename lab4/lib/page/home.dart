import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lab4/controller/home_controller.dart';

import 'package:lab4/widget/button_categories.dart';
import '../models/categories.dart' show Categoie;
import '../models/product.dart';
import '../widget/Best Selling.dart';
import '../widget/SeeAll.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  void initState() {
    Get.lazyPut(() => HomeController());
    Get.put(HomeController());
    HomeController controller = Get.find();
    controller.readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(),
        backgroundColor: Colors.transparent,

        elevation: 0,
        title: Container(
          child: Text(
            'Categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Text',
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Container(
              height: 90,
              child: ListView.builder(
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ButtonCategories(
                      category: controller.categories[index],
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23),
            child: Container(
              height: 24,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  SeeAll(),
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              child: Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: controller.product.length,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 8,
                  itemBuilder: (context, index) {
                    return BestSelling(
                      product: controller.product[index],
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
