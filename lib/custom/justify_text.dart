import 'package:flutter/material.dart';

class JustifyText extends StatelessWidget {
  String data;

  JustifyText({required this.data});
  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: TextAlign.justify);
  }
}
