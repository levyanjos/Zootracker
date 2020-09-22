import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  File image;

  ImageView({this.image});

  @override
  _ImageViewState createState() => _ImageViewState(image: image);
}

class _ImageViewState extends State<ImageView> {
  File image;

  _ImageViewState({this.image});

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.file(
                image,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ],
          )
        : Container(
            height: 150,
            color: Colors.grey,
          );
  }
}
