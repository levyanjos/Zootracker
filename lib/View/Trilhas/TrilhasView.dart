import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:zootracker/View/Components/CustomNavBar.dart';

class TrilhasView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Tab 1",
      uniqueHeroTag: 'tab1',
      body: TilhasContainerView()
    );
  }
}

class TilhasContainerView extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('You have pressed the button times.')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
