import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:zootracker/View/Search/CupertinoSearchView.dart';
import 'package:zootracker/View/Search/MaterialSearchBar.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: CupertinoSearchView(),
          )
        : MaterialSearchBar();
  }
}
