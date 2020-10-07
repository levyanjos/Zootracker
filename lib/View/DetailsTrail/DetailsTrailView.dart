import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/AnimalRegistration/AnimalRegistrationView.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/View/Components/CircleImageViewCell.dart';
import 'package:zootracker/View/Components/CustomUIButton.dart';
import 'package:zootracker/View/Components/FromView.dart';
import 'package:zootracker/View/Components/SectionHeaderView.dart';
import 'package:zootracker/ViewControllers/FormViewController.dart';

class DetailsTrailView extends StatefulWidget {
  FormViewController _controller;

  DetailsTrailView(Trail trail) {
    this._controller = FormViewController.loadingTrail(true, trail);
  }

  @override
  _DetailsTrailViewState createState() =>
      _DetailsTrailViewState(controller: this._controller);
}

class _DetailsTrailViewState extends State<DetailsTrailView> {
  final FormViewController controller;

  _DetailsTrailViewState({this.controller});

  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Trilha"),
      uniqueHeroTag: "detailsTrailsNavBar",
      body: FormView(
        controller: controller,
        footerWidget: Container(
          height: 230,
          child: Column(
            children: <Widget>[
              SectionHeaderView(
                leading: BarButtonItem(
                  child: Icon(
                    Icons.add,
                    color: Styles.actionColor,

                  ),
                  callBack: () {
                    _pushToCorrectPresentation(context, false, AnimalRegistration());
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) =>
                      CircleImageViewCell(),
                ),
              ),
              CustomUIButton(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        BarButtonItem(
          child: Icon(
            Icons.edit,
            color: Styles.actionColor,
          ),
        ),
        BarButtonItem(
          child: Icon(
            Icons.delete,
            color: Styles.actionColor,
          ),
        ),
      ],
    );
  }

  void _pushToCorrectPresentation(
      BuildContext context, bool isFullScreen, Widget screem) {
    Navigator.push(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(
          fullscreenDialog: isFullScreen,
          builder: (context) => screem,
        )
            : MaterialPageRoute(
          fullscreenDialog: isFullScreen,
          builder: (context) => screem,
        ));
  }
}
