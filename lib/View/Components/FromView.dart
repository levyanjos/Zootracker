import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/View/Components/Inputs/CustomImagePicker.dart';
import 'package:zootracker/View/Components/Inputs/DateInputField.dart';
import 'package:zootracker/View/Components/Inputs/TextInputField.dart';
import 'package:zootracker/ViewControllers/FormViewController.dart';

class FormView extends StatefulWidget {
  final FormViewController controller;
  final Widget footerWidget;

  FormView({this.controller, this.footerWidget});

  @override
  _FormViewState createState() => _FormViewState(controller: this.controller, footerWidget: footerWidget);
}

class _FormViewState extends State<FormView> {
  final FormViewController controller;
  final Widget footerWidget;

  _FormViewState({this.controller, this.footerWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: ListView(
            children: <Widget>[
              CustomImagePicker(
                isEnable: !controller.isReadOnly,
                image: controller.trailBanner,
              ),
              TextInputField(
                isReadOnly: controller.isReadOnly,
                controller: controller.titleController,
                title: "Nome da Trilha:",
              ),
              TextInputField(
                isReadOnly: controller.isReadOnly,
                controller: controller.locationController,
                title: "Local:",
              ),
              DateInputField(
                title: "Data:",
                date: controller.selectedDate,
                controller: controller.dateController,
                isEnable: !controller.isReadOnly,
              ),
              TextInputField(
                isReadOnly: controller.isReadOnly,
                controller: controller.notesController,
                title: "Anotações:",
                numberOfLines: 6,
              ),
              footerWidget ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
