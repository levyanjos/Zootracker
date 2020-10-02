import 'package:flutter/cupertino.dart';

class TrailSelectionCell extends StatefulWidget {
  final bool selected;
  final Function callBack;
  final String title;
  final String location;
  final String date;

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
        color: widget.selected == true ? CupertinoColors.inactiveGray : CupertinoColors.white,
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
                        ? Icon(CupertinoIcons.circle_filled)
                        : Icon(CupertinoIcons.circle),
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
                    Text(widget.date,
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
