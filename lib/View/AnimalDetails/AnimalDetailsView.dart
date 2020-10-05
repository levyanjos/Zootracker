import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class AnimalDetailsView extends StatefulWidget {
  final Trail trilha;

  AnimalDetailsView({@required this.trilha}) : assert(trilha != null);

  @override
  _AnimalDetailsViewState createState() => _AnimalDetailsViewState();
}

class _AnimalDetailsViewState extends State<AnimalDetailsView> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text(widget.trilha.title),
      uniqueHeroTag: "AnimalDetailsViewNavBar",
      body: MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.location_on)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                new Container(
                  color: Colors.deepOrangeAccent,
                  child: new Center(
                    child: new Text(
                      "Primeira Guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
                new Container(
                  color: Colors.blueGrey,
                  child: new Center(
                    child: new Text(
                      "Segunda guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
                new Container(
                  color: Colors.teal,
                  child: new Center(
                    child: new Text(
                      "Terceira guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
