import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/Model/Animal.dart';

class AnimalCell extends StatefulWidget {
  final Animal animal;

  AnimalCell({@required this.animal}) : assert(animal != null);

  @override
  _AnimalCellState createState() => _AnimalCellState();
}

class _AnimalCellState extends State<AnimalCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.animal.nome,
                    style:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 240,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/${widget.animal.imagem}'),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.animal.descricao,
                maxLines: 3,
                style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          ),
          Divider()
        ],
      ),
    );
  }
}
