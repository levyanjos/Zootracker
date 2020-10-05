import 'package:flutter/cupertino.dart';
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
      body: Container(),
    );
  }
}
