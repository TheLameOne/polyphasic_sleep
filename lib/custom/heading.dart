import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/custom/justify_text.dart';

class Heading extends StatelessWidget {
  String data;
  Heading({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: AutoSizeText(
        data,
        maxLines: 1,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      )),
    );
  }
}
