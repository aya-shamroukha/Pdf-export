// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({
    super.key,
    required this.title,
    required this.onpress,
    required this.colors, required this.width, 
    required this.height, this.boxshadow, required this.radius, this.textcolor,  this.fontsize,
  });

  final String title;
  final dynamic onpress;
  final Color? colors;
  final Color? textcolor;
  final double width;
  final double height;
  final double radius;
   final double ?fontsize;
 final dynamic boxshadow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      child: InkWell(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [boxshadow],
              borderRadius: BorderRadius.circular(radius), color: colors),
          margin: EdgeInsets.only(left: 6),
          width: width,
          height: height,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w500,
                  color: textcolor),
            ),
          ),
        ),
      ),
    );
  }
}
