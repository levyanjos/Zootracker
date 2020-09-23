import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/CreateTrail/CreateTrailView.dart';
import 'package:zootracker/View/DetailsTrail/DetailsTrailView.dart';
import 'package:zootracker/View/Trails/TrailsCell.dart';

class TrailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
        text: "Trilhas", uniqueHeroTag: 'tab1', body: TrailsContainerView());
  }
}

class TrailsContainerView extends StatelessWidget {
  didSelectTrailInList(BuildContext context, Trail trail) {
    pushToCorrectPresentation(
        context,
        false,
        DetailsTrailView(
          trail,
        )
    );
  }

  pushToCorrectPresentation(
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: mockTrails.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 0),
              child: GestureDetector(
                onTap: () => didSelectTrailInList(context, mockTrails[index]),
                child: TrailCell(
                  trail: mockTrails[index],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
          onPressed: () =>
              pushToCorrectPresentation(context, true, CreateTrails()),
        ),
      ),
    );
  }
}
