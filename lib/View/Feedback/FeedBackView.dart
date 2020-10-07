import 'package:flutter/cupertino.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';

class FeedBackView extends StatefulWidget {
  @override
  _FeedBackViewState createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Sobre Nós"),
      uniqueHeroTag: "FeedBackViewNavBar",
      body: Container(
        color: Styles.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: <Widget>[
              Container(
                width: 100,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage("assets/images/ufc.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text("""
                Esse projeto faz parte do Programa de Pós- Graduação em Sistemática, Uso e Conservação da Biodiversidade (PPGSIS), do Centro de Ciências e vinculado ao Departamento de Biologia da Universidade Federal do Ceará -UFC. Além da disciplina Projeto Integrado I da graduação em Sistemas e Mídias Digitais. 
           
Idealização e conteúdo: \n\nPós granduanda Karol \nProfessor Orientador, PhD. Hugo Fernandes-Ferreira.
    
Desenvolvedores: \n\nAna Eloise \nBrunno Raphael \nLevy Cristian \nThais Gomes
  """),
              )
            ],
          ),
        ),
      ),
    );
  }
}
