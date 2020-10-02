import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Camera/TrailSelectionCell.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class TrailsSelectionListView extends StatefulWidget {
  List<int> selectedIndexs = [];

  @override
  _TrailsSelectionListViewState createState() =>
      _TrailsSelectionListViewState();
}

class _TrailsSelectionListViewState extends State<TrailsSelectionListView> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Salvar",
      uniqueHeroTag: "TrailsSelectionListViewNavBar",
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: mockTrails.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TrailSelectionCell(
                title: mockTrails[index].title,
                location: mockTrails[index].title,
                date: mockTrails[index].date.toIso8601String(),
                selected: widget.selectedIndexs.contains(index),
                callBack: () {
                  if (widget.selectedIndexs.contains(index)) {
                    widget.selectedIndexs.remove(index);
                  } else {
                    widget.selectedIndexs.add(index);
                  }
                  setState(() {});
                },
              ),
            );
          }),
    );
  }
}
