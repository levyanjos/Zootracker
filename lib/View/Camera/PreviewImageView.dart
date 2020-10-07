import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:zootracker/View/Camera/TrailsSelectionListView.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';

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
      title: Text("Preview"),
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
            color: Styles.actionColor,
          ),
          callBack: () => {
            _showAlertDialog(
              context,
              'Deseja salvar a imagem na galeria ou em uma trilha?',
              <Widget>[
                _createAlertAction(
                    Text("Galeria"), () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  getBytesFromFile().then((bytes) {
                    Share.file('Share via:', basename(widget.imagePath),
                        bytes.buffer.asUint8List(), 'image/png');
                  });
                }),
                _createAlertAction(
                    Text("Trilha"), () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  _pushToCorrectPresentation(
                      context, false, TrailsSelectionListView());
                })
              ],
            )
          },
        ),
        BarButtonItem(
          child: Icon(
            Icons.delete,
            color: Styles.actionColor,
          ),
          callBack: () => {
            _showAlertDialog(
              context,
              'Deseja descartar o registro?',
              <Widget>[
                _createAlertAction(
                    Text(
                      "Descartar",
                      style: TextStyle(color: Colors.red),
                    ), () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  Navigator.pop(context);
                }),
                _createAlertAction(
                    Text("Cancelar"), () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                }),
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
    if (Platform.isIOS) {
      var alert = CupertinoAlertDialog(
        title: Text(title),
        actions: buttons,
      );

      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      var alert = AlertDialog(
        title: Text(title),
        actions: buttons,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  _createAlertAction(Widget child, Function action) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        child: child,
        onPressed: action,
      );
    } else {
      return FlatButton(
        child: child,
        onPressed: action,
      );
    }
  }

  _pushToCorrectPresentation(
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
