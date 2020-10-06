import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Filter/FilterView.dart';

class ApplyFilterView extends StatefulWidget {
  @override
  _ApplyFilterViewState createState() => _ApplyFilterViewState();
}

class _ApplyFilterViewState extends State<ApplyFilterView> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Filters"),
      uniqueHeroTag: "FilterViewNavBar",
      body: FilterView(),
      actions: <Widget>[
        BarButtonItem(
          child: Icon(Icons.check),
          callBack: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
