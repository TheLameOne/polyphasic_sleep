import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  String textData;
  String? heading;

  TextBox({required this.textData, this.heading});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.heading != null)
      return Container(
        child: Text(widget.textData),
      );
    else
      return Container(
        child: Text(widget.textData),
      );
  }
}
