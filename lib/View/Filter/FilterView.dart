import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  String name;
  String email;
  String location;
  String pin;
  DateTime dateTime = DateTime.now();
  String dropdownValue = 'One';
  List<String> options = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSizeSection(
          "Tamanho das pegadas anteriores",
          <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
              _buildNumberPadField("Comprimento:", " 0 cms", name, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
              _buildNumberPadField("Largura:", " 0 cms", location, true),
            ),
          ],
        ),
        _buildSizeSection(
          "Tamanho das pegadas posteriores",
          <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
              _buildNumberPadField("Comprimento:", " 0 cms", name, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
              _buildNumberPadField("Largura:", " 0 cms", location, true),
            ),
          ],
        ),
        _buildSizeSection(
          "Demais Dados",
          <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPicker(
                  "Número de dígitos:", options, dropdownValue, true),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPicker(
                  "Formato de dígitos:", options, dropdownValue, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPicker(
                  "Presença de garras:", options, dropdownValue, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPicker(
                  "Ordem taxonômica:", options, dropdownValue, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPicker("Estado:", options, dropdownValue, false),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSizeSection(String title, List<Widget> children) {
    var widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 4),
        child: _buildHeaderView(title),
      ),
    ];

    children.forEach((element) {
      widgets.add(element);
    });

    return Column(
      children: widgets,
    );
  }

  Widget _buildNumberPadField(
      String prefixText, String placeholder, String stringState, bool isLast) {
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      prefix: Text(prefixText),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: !isLast
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0,
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            )
          : null,
      placeholder: placeholder,
      onChanged: (newName) {
        setState(() {
          stringState = newName;
        });
      },
    );
  }

  Widget _buildHeaderView(String title) {
    return Column(
      children: [
        Divider(
          color: CupertinoColors.inactiveGray,
        ),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropDownField(
      String title, List<String> options, String stringState, bool isFirst) {
    return Column(
      children: [
        isFirst
            ? Container()
            : Divider(
                color: CupertinoColors.inactiveGray,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: CupertinoColors.inactiveGray,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down),
                value: stringState,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  setState(() {
                    stringState = newValue;
                  });
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCupertinioPicker(
      String title, List<String> options, String stringState, bool isFirst) {
    return Column(
      children: [
        isFirst
            ? Container()
            : Divider(
                color: CupertinoColors.inactiveGray,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: CupertinoColors.inactiveGray,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("selecione"),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: CupertinoColors.white,
                        height: 200.0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    setState(() {
                                    });
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                itemExtent: 32.0,
                                onSelectedItemChanged: (int index) {
                                  setState(() {
                                    stringState = options[index];
                                  });
                                },
                                children: new List<Widget>.generate(
                                    options.length, (int index) {
                                  return new Center(
                                    child: new Text(options[index]),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPicker(
      String title, List<String> options, String stringState, bool isFirst) {
    return Platform.isAndroid
        ? _buildDropDownField(title, options, stringState, isFirst)
        : _buildCupertinioPicker(title, options, stringState, isFirst);
  }
}