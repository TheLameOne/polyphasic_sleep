import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Color borderColor;
  Color color;
  String data;
  double height;
  double width;

  CustomContainer(
      {required this.borderColor,
      required this.color,
      required this.data,
      this.height = 50,
      this.width = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(data)));
  }
}
