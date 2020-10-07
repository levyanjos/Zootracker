//stf

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          trail.title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
        ),
        Container(
          width: 100,
          height: 240,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage("https://www.w3schools.com/w3css/img_lights.jpg"),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(trail.location ?? "Sem localização",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(DateFormat.yMMMd().add_jm().format(trail.date),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        )
      ],
    );
  }
}
