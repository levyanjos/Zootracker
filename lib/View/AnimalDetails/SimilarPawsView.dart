import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/AnimalDetails/AnimalCell.dart';
import 'package:zootracker/View/AnimalDetails/AnimalDetailsView.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class SimilarPawsView extends StatefulWidget {
  final List<Trail> animals;

  const SimilarPawsView({Key key, @required this.animals}) : super(key: key);

  @override
  _SimilarPawsViewState createState() => _SimilarPawsViewState();
}

class _SimilarPawsViewState extends State<SimilarPawsView> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Importante"),
      uniqueHeroTag: "SimilarPawsViewNavBar",
      body: ListView.builder(
          itemCount: widget.animals.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(),
              onTap: () {
                _pushToCorrectPresentation(context, false, AnimalDetailsView(trilha: widget.animals[index]));
              },
            );
          }),
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
