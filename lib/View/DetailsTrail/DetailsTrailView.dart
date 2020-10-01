import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/CircleImageViewCell.dart';
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
      text: "Trilha",
      uniqueHeroTag: "detailsTrailsNavBar",
      body: FormView(
        controller: controller,
        footerWidget: Container(
          height: 140,
          child: Column(
            children: <Widget>[
              SectionHeaderView(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) => CircleImageViewCell(),
                ),
              ),
            ],
          ),
      ),
      actions: <Widget>[
        BarButtonItem(
          child: Icon(
            Icons.delete,
            color: CupertinoColors.label,
          ),
        ),
        BarButtonItem(
          child: Icon(
            Icons.edit,
            color: CupertinoColors.label,
          ),
        ),
        BarButtonItem(
          child: Icon(
            Icons.picture_as_pdf,
            color: CupertinoColors.label,
          ),
        ),
      ],
    );
  }
}
