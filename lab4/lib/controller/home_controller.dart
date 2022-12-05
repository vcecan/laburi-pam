import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/categories.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<Product> product = RxList();
  RxList<Categoie> categories = RxList();

  Future<void> readJsonFile() async {
    final String jsonString =
        await rootBundle.loadString('assets/Json/shop.json');
    final data = await json.decode(jsonString);

    product.value = (data['products'] as List)
        .map((value) => Product.fromJson(value))
        .toList();
    categories.value = (data['categories'] as List)
        .map((value) => Categoie.fromJson(value))
        .toList();

  }
}


