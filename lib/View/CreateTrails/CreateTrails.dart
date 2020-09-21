import 'dart:io';
import 'package:flutter/material.dart';
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
      trailBanner: this.trailBanner, titleController: this.titleController);
}

class _CreateTrailsState extends State<CreateTrails> {
  DateTime selectedDate;
  TextEditingController dateController;
  TextEditingController titleController;
  TextEditingController locationController;
  TextEditingController notesController;
  File trailBanner;

  _CreateTrailsState(
      {this.selectedDate, this.dateController, this.trailBanner, this.titleController, this.locationController, this.notesController});

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
        ));
  }
}
