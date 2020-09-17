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
      child: Container(
        color: Colors.redAccent,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  !Platform.isIOS
                      ? CupertinoPageRoute(
                    builder: (context) => PurplePage(),
                  )
                      : MaterialPageRoute(
                    builder: (context) => PurplePage(),
                  ));
            },
            child: Text('Go to test page', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}

class PurplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Tab 1",
      uniqueHeroTag: 'purplePage',
      child: Container(
        color: Colors.deepPurple,
      ),
    );
  }
}