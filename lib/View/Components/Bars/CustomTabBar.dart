import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Camera/CameraView.dart';
import 'package:zootracker/View/Search/SearchView.dart';
import 'package:zootracker/View/Trails/TrailsView.dart';
import 'package:zootracker/ViewModel/SearchViewModel.dart';
import 'package:zootracker/main.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({Key key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/caderno.png",
                width: 40,
                height: 40,
              ),
              title: Text("Caderno De Campo")),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/camera.png",
                width: 40,
                height: 40,
              ),
              title: Text("Câmera")),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/busca.png",
                width: 40,
                height: 40,
              ),
              title: Text("Busca")),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/feedback.png",
                width: 25,
                height: 25,
              ),
              title: Text("Feedback")),
        ]),
        tabBuilder: (context, index) {
          if (index == 0) {
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              builder: (BuildContext context) =>
                  ChangeNotifierProvider<TrailsViewModel>(
                create: (_) => TrailsViewModel()..loadTrails(),
                child: TrailsView(),
              ),
            );
          } else if (index == 1) {
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => CameraView(),
            );
          } else if (index == 2) {
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) =>
                  ChangeNotifierProvider<SearchViewModel>(
                create: (_) => SearchViewModel()..loadAnimals(),
                child: SearchView(),
              ),
            );
          } else {
            return CupertinoTabView(
              navigatorKey: fifthTabNavKey,
              builder: (BuildContext context) => TrailsView(),
            );
          }
        });
  }
}
