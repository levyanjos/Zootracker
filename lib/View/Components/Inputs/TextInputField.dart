import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final String placeholder;
  final int numberOfLines;
  final bool isReadOnly;
  final TextEditingController controller;

  TextInputField(
      {this.title, this.placeholder, this.numberOfLines, this.controller, this.isReadOnly});

  @override
  _TextInputFieldState createState() => _TextInputFieldState(
      title: this.title,
      placeholder: this.placeholder,
      numberOfLines: this.numberOfLines,
      controller: this.controller,
      isReadOnly: this.isReadOnly);
}

class _TextInputFieldState extends State<TextInputField> {
  final String title;
  final String placeholder;
  final int numberOfLines;
  final bool isReadOnly;
  TextEditingController controller;

  _TextInputFieldState(
      {this.title, this.placeholder, this.numberOfLines, this.controller, this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
              children: [
                Text(title ?? '',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: !Platform.isIOS
                ? TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: placeholder ?? ''),
                    maxLines: numberOfLines ?? 1,
                    readOnly: this.isReadOnly,
                  )
                : CupertinoTextField(
                    controller: controller,
                    placeholder: placeholder ?? '',
                    maxLines: numberOfLines ?? 1,
                    readOnly: this.isReadOnly,
                  ),
          )
        ],
      ),
    );
  }
}
