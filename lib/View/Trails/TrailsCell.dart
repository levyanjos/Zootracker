//stf

import 'package:flutter/cupertino.dart';
import 'package:zootracker/Model/Trail.dart';

class TrailCell extends StatefulWidget {
  final Trail trail;

  TrailCell({this.trail});

  @override
  _TrailCellState createState() => _TrailCellState(trail: this.trail);
}

class _TrailCellState extends State<TrailCell> {
  final Trail trail;

  _TrailCellState({this.trail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network("https://www.w3schools.com/w3css/img_lights.jpg"),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Row(
                children: [
                  Text(
                      "${trail.date.day}/${trail.date.month}/${trail.date.year}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  trail.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        )
      ],
    );
  }
}
