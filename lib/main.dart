import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/Bars/CustomTabBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            title: 'Flutter Demo',
            theme: CupertinoThemeData(
              primaryColor: Styles.actionColor,
            ),
            home: CustomTabBar(),
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Styles.actionColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: CustomTabBar(),
            debugShowCheckedModeBanner: false,
          );
  }
}
