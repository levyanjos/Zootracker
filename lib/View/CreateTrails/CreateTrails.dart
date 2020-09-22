import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Inputs/DateInputField.dart';
import 'package:zootracker/View/Components/Inputs/CustomImagePicker.dart';
import 'package:zootracker/View/Components/Inputs/TextInputField.dart';

class CreateTrails extends StatefulWidget {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  File trailBanner;

  @override
  _CreateTrailsState createState() => _CreateTrailsState(
      selectedDate: this.selectedDate,
      dateController: this.dateController,
      trailBanner: this.trailBanner,
      titleController: this.titleController);
}

class _CreateTrailsState extends State<CreateTrails> {
  DateTime selectedDate;
  TextEditingController dateController;
  TextEditingController titleController;
  TextEditingController locationController;
  TextEditingController notesController;
  File trailBanner;

  _CreateTrailsState(
      {this.selectedDate,
      this.dateController,
      this.trailBanner,
      this.titleController,
      this.locationController,
      this.notesController});

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Criar Trilha",
      uniqueHeroTag: "createTrailsNavBar",
      body: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ListView(
              children: <Widget>[
                CustomImagePicker(
                  isEnable: true,
                  image: trailBanner,
                ),
                TextInputField(
                  controller: titleController,
                  title: "Nome da Trilha:",
                ),
                TextInputField(
                  controller: locationController,
                  title: "Local:",
                ),
                DateInputField(
                  title: "Data:",
                  date: selectedDate,
                  controller: dateController,
                ),
                TextInputField(
                  controller: notesController,
                  title: "Anotações:",
                  numberOfLines: 6,
                ),
              ],
            ),
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          if (titleController.text != "") {
            var trail = Trail(title: titleController.text, date: selectedDate);
            mockTrails.add(trail);
            Navigator.pop(context);
          }
        },
        child: Text('Salvar',
            style: TextStyle(
              color: CupertinoColors.activeBlue,
            )),
      ),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () {
            if (titleController.text != "") {
              var trail =
              Trail(title: titleController.text, date: selectedDate);
              mockTrails.add(trail);
              Navigator.pop(context);
            }
          },
          child: Text("Save"),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );
  }
}
