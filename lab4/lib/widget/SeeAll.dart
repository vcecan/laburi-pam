import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348,
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Best Selling',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Text',
              color: Color(0xff000000),
            ),
          ),
          Text(
            'See all',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF Pro Text',
            ),
          ),
        ],
      ),
    );
  }
}
