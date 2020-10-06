import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zootracker/Model/Animal.dart';
import 'package:zootracker/View/AnimalDetails/SimilarPawsView.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/ViewModel/SearchViewModel.dart';

class AnimalDetailsView extends StatefulWidget {
  final Animal animal;

  AnimalDetailsView({@required this.animal}) : assert(animal != null);

  @override
  _AnimalDetailsViewState createState() => _AnimalDetailsViewState();
}

class _AnimalDetailsViewState extends State<AnimalDetailsView> {
  @override
  Widget build(BuildContext context) {

    return CustomNavBar(
      title: Text(widget.animal.nome),
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
                Container(
                  child: ListView(
                    children: <Widget>[
                      _buildSectionWithImage(widget.animal.imagem, widget.animal.descricao),
                    ]
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      _buildSectionWithImage(widget.animal.localizacao.imagemLocal, widget.animal.localizacao.nomeLocal),
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          widget.animal.pegada.pegadasSimi.length > 0
                              ? _buildAlertToClousesApparence()
                              : Container(),
                          _buildSectionWithImage("","")],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionWithImage(String imagePath, String decription) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              width: 100,
              height: 240,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: imagePath != ""
                          ? AssetImage('assets/images/${imagePath}')
                          : AssetImage('assets/images/notFound.jpg')
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              decription,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertToClousesApparence() {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Icon(Icons.info),
            Spacer(),
            Text("Clique aqui para ver pegadas parecidas!"),
            Spacer()
          ],
        ),
      ),
      onTap: () {
        _pushToCorrectPresentation(context, false,
          ChangeNotifierProvider<SearchViewModel>(
            create: (_) => SearchViewModel()..loadAnimals(),
            child: SimilarPawsView(animalsIds: widget.animal.pegada.pegadasSimi,),
          ));
      },
    );
  }

  void _pushToCorrectPresentation(
      BuildContext context, bool isFullScreen, Widget screem) {
    Navigator.push(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(
          fullscreenDialog: isFullScreen,
          builder: (context) => screem,
        )
            : MaterialPageRoute(
          fullscreenDialog: isFullScreen,
          builder: (context) => screem,
        ));
  }
}
