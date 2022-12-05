import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'laborator 4',
        home: Home(),
        theme: ThemeData(primarySwatch: Colors.blue));
  }
}
