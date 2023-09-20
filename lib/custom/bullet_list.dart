import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/custom/justify_text.dart';

class BulletList extends StatelessWidget {
  List? data;

  BulletList({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [for (var x in data!) JustifyText(data: "\u2022" + x)],
    );
  }
}
