import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final String placeholder;

  TextInputField({this.title, this.placeholder});
  @override
  _TextInputFieldState createState() =>
      _TextInputFieldState(title: this.title, placeholder: this.placeholder);
}

class _TextInputFieldState extends State<TextInputField> {
  final String title;
  final String placeholder;

  _TextInputFieldState({this.title, this.placeholder});

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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: placeholder ?? ''),
                  )
                : CupertinoTextField(
                    placeholder: placeholder ?? '',
                  ),
          )
        ],
      ),
    );
  }
}
