import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/View/Components/FromView.dart';
import 'package:zootracker/ViewControllers/FormViewController.dart';

class CreateTrails extends StatefulWidget {
  FormViewController controller = FormViewController(false);

  @override
  _CreateTrailsState createState() =>
      _CreateTrailsState(controller: this.controller);
}

class _CreateTrailsState extends State<CreateTrails> {
  final FormViewController controller;

  _CreateTrailsState({this.controller});

  saveTrail(context) {
    if (controller.titleController.text != "") {
      var trail = Trail(
          title: controller.titleController.text,
          date: controller.selectedDate);
      TrailRepository.mockTrails.add(trail);
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Criar Caderno"),
      uniqueHeroTag: "createTrailsNavBar",
      body: FormView(
        controller: controller,
      ),
      actions: <Widget>[
        BarButtonItem(
          size: 40,
          callBack: () => saveTrail(context),
          child: Text(
            'Salvar',
            style: TextStyle(
              color: Styles.actionColor,
            ),
          ),
        )
      ],
    );
  }
}
