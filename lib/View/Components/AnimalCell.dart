import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';

class AnimalCell extends StatefulWidget {
  final Trail trilha;

  AnimalCell({@required this.trilha}) : assert(trilha != null);

  @override
  _AnimalCellState createState() => _AnimalCellState();
}

class _AnimalCellState extends State<AnimalCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.trilha.title,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Loremipsum...hsu ahsua suhau sauh suah usha uhhsauhs shuahsuhaus hauhsua suaushauh suahsuahs uhausuah suhauhsuah suhaushu ahsuhauhsuahushaushuahsuahsuahsuahushau.",
                  maxLines: 3,
                  style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
            ),
            Divider()
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
