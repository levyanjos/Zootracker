import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  File image;

  CustomImagePicker({this.image});

  @override
  _CustomImagePickerState createState() =>
      _CustomImagePickerState(image: this.image);
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  File image;
  final picker = ImagePicker();

  _CustomImagePickerState({this.image});

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.getImage();
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 8),
          child: Stack(
            children: <Widget>[
              image != null
                  ? Column( crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.file(
                          image,
                        height: 150,
                        fit: BoxFit.fitWidth,
                        ),
                    ],
                  )
                  : Container(height: 150, color: Colors.grey,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 150, child: Center(child: Icon(Icons.camera))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
