import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/categories.dart';

class ButtonCategories extends StatelessWidget {
  final Categoie category;

  const ButtonCategories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // print('ButtonCategories ${widget.category.icon}');

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Color(0xffF4F4F4).withOpacity(1),
              //       spreadRadius: 10,
              //       blurRadius: 30,
              //
              //       offset: Offset(0, 9), // changes position of shadow
              //     ),
              //   ],
              //
              // ),
              child: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(category.icon),
                    ),
                  ),
                  radius: 30,
                  backgroundColor: const Color(0xffffffff)),
              // elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Container(
                //width: 60,
                height: 16,
                child: Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
