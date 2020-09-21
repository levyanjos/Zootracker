import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/CustomNavBar.dart';
import 'package:zootracker/View/Components/DateInputField.dart';
import 'package:zootracker/View/Components/ImagePicker.dart';
import 'package:zootracker/View/Components/TextInputField.dart';

class CreateTrails extends StatefulWidget {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  File trailBanner;

  @override
  _CreateTrailsState createState() => _CreateTrailsState(
      selectedDate: this.selectedDate,
      dateController: this.dateController,
      trailBanner: this.trailBanner);
}

class _CreateTrailsState extends State<CreateTrails> {
  DateTime selectedDate;
  TextEditingController dateController;
  File trailBanner;

  _CreateTrailsState(
      {this.selectedDate, this.dateController, this.trailBanner});

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
                    title: "Nome da Trilha:",
                  ),
                  TextInputField(
                    title: "Local:",
                  ),
                  DateInputField(
                    title: "Data:",
                    date: selectedDate,
                    controller: dateController,
                  ),
                  TextInputField(
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
