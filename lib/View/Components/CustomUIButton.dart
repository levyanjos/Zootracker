import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';

class CustomUIButton extends StatefulWidget {
  final Function callBack;

  CustomUIButton({this.callBack});

  @override
  _CustomUIButtonState createState() =>
      _CustomUIButtonState(callBack: this.callBack);
}

class _CustomUIButtonState extends State<CustomUIButton> {
  final Function callBack;

  _CustomUIButtonState({this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 18.0,
        color: Styles.actionColor,
        clipBehavior: Clip.antiAlias, // Add This
        child: MaterialButton(
          minWidth: 200.0,
          height: 42,
          color: Styles.actionColor,
          child: Text(
            "Gerar\nDocumento",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onPressed: callBack,
        ),
      ),
    );
  }
}
