import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class CustomNavBar extends StatelessWidget {
  final Widget title;
  final String uniqueHeroTag;
  final Widget body;
  final List<Widget> actions;

  CustomNavBar({
    this.title,
    this.uniqueHeroTag,
    this.body,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: title,
          actions: actions ?? [],
        ),
        body: body,
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          heroTag: uniqueHeroTag,
          transitionBetweenRoutes: false,
          middle: title,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: actions ?? [],
          ),
        ),
        child: body,
      );
    }
  }
}