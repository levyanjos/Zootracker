import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zootracker/View/AnimalDetails/AnimalCell.dart';
import 'package:zootracker/View/AnimalDetails/AnimalDetailsView.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/View/Filter/ApplyFilterView.dart';
import 'package:zootracker/ViewModel/SearchViewModel.dart';


class CupertinoSearchView extends StatefulWidget {
  @override
  _CupertinoSearchViewState createState() => _CupertinoSearchViewState();
}

class _CupertinoSearchViewState extends State<CupertinoSearchView> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SearchViewModel>(context);
    final results = model.search(_terms);
    var _statusBarHeight = MediaQuery.of(context).padding.top;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.backgroundColor,
      ),
      child: Column(
        children: [
          _buildSearchBox(_statusBarHeight),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                child: AnimalCell(animal: results[index].animal),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: false,
                      builder: (context) => AnimalDetailsView(animal: results[index].animal),
                    ),
                  );
                },
              ),
              itemCount: results.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox(double statusHeight) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: CupertinoColors.white,
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: 12 + statusHeight, bottom: 8, left: 12, right: 12),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pesquisa",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BarButtonItem(
                              child: Icon(Icons.filter_list),
                              callBack: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    fullscreenDialog: false,
                                    builder: (context) => ApplyFilterView(),
                                  ),
                                );
                              }),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4, left: 12, right: 12, bottom: 12),
                child: SearchBar(
                  controller: _controller,
                  focusNode: _focusNode,
                ),
              ),
              Divider(
                color: CupertinoColors.opaqueSeparator,
                height: 0,
              )
            ],
          ),
        ));
  }
}
