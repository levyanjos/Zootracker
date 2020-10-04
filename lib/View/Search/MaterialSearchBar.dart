import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class MaterialSearchBar extends StatefulWidget {
  @override
  _MaterialSearchBarState createState() => _MaterialSearchBarState();
}

class _MaterialSearchBarState extends State<MaterialSearchBar> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TrailsViewModel>(context);
    final results = model.getTrailCellsViewModel();

    return CustomNavBar(
      title: Text("Pesquisa"),
      uniqueHeroTag: "MaterialSearchBarNavBar",
      actions: <Widget>[
        BarButtonItem(
          child: Icon(Icons.search),
          callBack: () {
            showSearch(context: context, delegate: Search(searchContext: context));
          },
        ),
        BarButtonItem(
          child: Icon(Icons.filter_list),
          callBack: () {
          },
        )
      ],
      body: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Text(results[index].trail.title);
      }),
    );
  }
}

class Search extends SearchDelegate {
  final BuildContext searchContext;
  TrailCellViewModel selectedResult;

  Search({this.searchContext});


  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final model = Provider.of<TrailsViewModel>(searchContext);
    final results = model.search(query);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index].trail.title,
          ),
          onTap: (){
            selectedResult = results[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult.trail.title),
      ),
    );
  }
}