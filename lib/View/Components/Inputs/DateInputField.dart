import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateInputField extends StatefulWidget {
  String title;
  String placeholder;
  DateTime date;
  TextEditingController controller;

  DateInputField({this.title, this.date, this.placeholder, this.controller});

  @override
  _DateInputFieldState createState() => _DateInputFieldState(
      title: this.title,
      date: this.date,
      placeholder: this.placeholder,
      controller: this.controller);
}

class _DateInputFieldState extends State<DateInputField> {
  String title;
  String placeholder;
  DateTime date;
  TextEditingController controller;

  _DateInputFieldState(
      {this.title, this.date, this.placeholder, this.controller});

  _selectDate(BuildContext context) async {
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
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: placeholder ?? ''),
                    readOnly: true,
                  )
                : CupertinoTextField(
                    controller: controller,
                    onTap: () => _selectDate(context),
                    placeholder: placeholder ?? '',
                    readOnly: true,
                  ),
          )
        ],
      ),
    );
  }
}
