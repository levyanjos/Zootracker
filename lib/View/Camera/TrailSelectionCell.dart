import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';

class TrailSelectionCell extends StatefulWidget {
  final bool selected;
  final Function callBack;
  final String title;
  final String location;
  final DateTime date;

  TrailSelectionCell(
      {this.title, this.location, this.date, this.selected, this.callBack});
  @override
  _TrailSelectionCellState createState() => _TrailSelectionCellState();
}

class _TrailSelectionCellState extends State<TrailSelectionCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callBack();
        setState(() {});
      },
      child: Container(
        color: widget.selected == true ? Styles.selectedbackgroundColor : CupertinoColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(color: CupertinoColors.black,
                          fontSize: 22,
                      fontWeight: FontWeight.normal),
                    ),
                    widget.selected == true
                        ? Icon(CupertinoIcons.circle_filled, color: Styles.actionColor,)
                        : Icon(CupertinoIcons.circle, color: Styles.actionColor),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Row(
                  children: [
                    Text(widget.location,
                        style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 6),
                child: Row(
                  children: [
                    Text(DateFormat.yMMMd().add_jm().format(widget.date),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
