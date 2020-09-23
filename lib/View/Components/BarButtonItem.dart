import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarButtonItem extends StatefulWidget {
  Function callBack;
  Widget child;
  double size;
  BarButtonItem({this.callBack, this.child, this.size});
  @override
  _BarButtonItemState createState() =>
      _BarButtonItemState(callBack: this.callBack, child: this.child, size: this.size);
}

class _BarButtonItemState extends State<BarButtonItem> {
  Function callBack;
  Widget child;
  double size;
  _BarButtonItemState({this.callBack, this.child, this.size});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: callBack,
            child: this.child,
          )
        : IconButton(
            iconSize: size ?? 26,
            onPressed: callBack,
            icon: this.child,
          );
  }
}
