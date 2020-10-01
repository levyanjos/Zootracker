import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class CameraView extends StatefulWidget {
  File image;

  @override
  _CameraViewState createState() => _CameraViewState(image: this.image);

}

class _CameraViewState extends State<CameraView> {
  ImagePicker _picker = ImagePicker();
  File image;

  _CameraViewState({this.image});

  @override
  void initState() {
    super.initState();
    this.getImage();
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
        text: "Câmera",
        uniqueHeroTag: "cameraNavBar",
        body: Container()
    );
  }
}
