import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zootracker/View/AnimalDetails/AnimalCell.dart';
import 'package:zootracker/View/AnimalDetails/AnimalDetailsView.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/ViewModel/SearchViewModel.dart';

class SimilarPawsView extends StatefulWidget {
  final List<String> animalsIds;

  const SimilarPawsView({Key key, @required this.animalsIds}) : super(key: key);

  @override
  _SimilarPawsViewState createState() => _SimilarPawsViewState();
}

class _SimilarPawsViewState extends State<SimilarPawsView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SearchViewModel>(context);
    final result = model.getAnimalsByIds(widget.animalsIds);

    return CustomNavBar(
      title: Text("Importante"),
      uniqueHeroTag: "SimilarPawsViewNavBar",
      body: Container(
        color: Styles.backgroundColor,
        child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: AnimalCell(animal: result[index].animal),
                onTap: () {
                  _pushToCorrectPresentation(context, false,
                      AnimalDetailsView(animal: result[index].animal));
                },
              );
            }),
      ),
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
