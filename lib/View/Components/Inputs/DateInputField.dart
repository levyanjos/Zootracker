import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateInputField extends StatefulWidget {
  String title;
  String placeholder;
  DateTime date;
  bool isEnable;
  TextEditingController controller;

  DateInputField({this.title, this.date, this.placeholder, this.controller, this.isEnable});

  @override
  _DateInputFieldState createState() => _DateInputFieldState(
      title: this.title,
      date: this.date,
      placeholder: this.placeholder,
      controller: this.controller,
      isEnable: this.isEnable);
}

class _DateInputFieldState extends State<DateInputField> {
  String title;
  String placeholder;
  DateTime date;
  bool isEnable;
  TextEditingController controller;

  _DateInputFieldState(
      {this.title, this.date, this.placeholder, this.controller, this.isEnable});

  _selectDate(BuildContext context) async {
    print("hereee");
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        controller.text = "${date.day}/${date.month}/${date.year}";
      });
  }

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
                    onTap: () => isEnable ? _selectDate(context) : null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: placeholder ?? ''),
                    readOnly: true,
                  )
                : CupertinoTextField(
                    controller: controller,
                    onTap: () => isEnable ? _selectDate(context) : null,
                    placeholder: placeholder ?? '',
                    readOnly: true,
                  ),
          )
        ],
      ),
    );
  }
}
