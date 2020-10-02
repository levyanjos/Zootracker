import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;

  PreviewImageScreen({this.imagePath});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      text: "Câmera",
      uniqueHeroTag: "previewNavBar",
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
          ],
        ),
      ),
      actions: <Widget>[
        BarButtonItem(
          child: Icon(
            Icons.file_download,
            color: CupertinoColors.label,
          ),
          callBack: () => {
            _showAlertDialog(
              context,
              'Deseja salvar a imagem na galeria ou em uma trilha',
              <Widget>[
                FlatButton(
                  child: Text("Galeria"),
                  onPressed: () {
                    getBytesFromFile().then((bytes) {
                      Share.file('Share via:', basename(widget.imagePath),
                          bytes.buffer.asUint8List(), 'image/png');
                    });
                  },
                ),
                FlatButton(
                  child: Text("Trilha"),
                  onPressed: () {},
                ),
              ],
            )
          },
        ),
        BarButtonItem(
          child: Icon(
            Icons.delete,
            color: CupertinoColors.label,
          ),
          callBack: () => {
            _showAlertDialog(
              context,
              'Deseja descartar o registro?',
              <Widget>[
                FlatButton(
                  child: Text(
                    "Descartar",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                ),
              ],
            )
          },
        ),
      ],
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }

  _showAlertDialog(BuildContext context, String title, List<Widget> buttons) {
    AlertDialog alerta = AlertDialog(
      title: Text(title),
      actions: buttons,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
