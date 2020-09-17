import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class CustomNavBar extends StatelessWidget {
  final String text;

  final TextStyle style;
  final String uniqueHeroTag;
  final Widget body;

  CustomNavBar({
    this.text,
    this.style,
    this.uniqueHeroTag,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            text,
            style: style,
          ),
        ),
        body: body,
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          heroTag: uniqueHeroTag,
          transitionBetweenRoutes: false,
          middle: Text(
            text,
            style: style,
          ),
        ),
        child: body,
      );
    }
  }
}