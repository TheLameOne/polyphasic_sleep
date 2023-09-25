import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Color borderColor;
  Color color;
  String data;
  double height;
  double width;
  int noOfItems;

  CustomContainer(
      {required this.borderColor,
      required this.color,
      required this.data,
      this.height = 50,
      this.width = 80,
      this.noOfItems = 4});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: height,
        width: (size.width - 32) / noOfItems,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          data,
          style: TextStyle(fontWeight: FontWeight.bold),
        )));
  }
}
