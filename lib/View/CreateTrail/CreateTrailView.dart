import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/FromView.dart';
import 'package:zootracker/ViewControllers/FormViewController.dart';


class CreateTrails extends StatefulWidget {
  FormViewController controller = FormViewController(false);

  @override
  _CreateTrailsState createState() => _CreateTrailsState(controller: this.controller);
}

class _CreateTrailsState extends State<CreateTrails> {
  final FormViewController controller;

  _CreateTrailsState({this.controller});

  saveTrail(context) {
    if (controller.titleController.text != "") {
      var trail = Trail(title: controller.titleController.text, date: controller.selectedDate);
      mockTrails.add(trail);
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Criar Trilha",
      uniqueHeroTag: "createTrailsNavBar",
      body: FormView(
        controller: controller,
      ),
      trailing: GestureDetector(
        onTap: () => saveTrail(context),
        child: Text('Salvar',
            style: TextStyle(
              color: CupertinoColors.activeBlue,
            )),
      ),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () => saveTrail(context),
          child: Text("Save"),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );
  }
}
