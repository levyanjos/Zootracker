import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zootracker/View/Camera/PreviewImageView.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';

class CameraView extends StatefulWidget {

  @override
  _CameraViewState createState() => _CameraViewState();

}

class _CameraViewState extends State<CameraView> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
        text: "Câmera",
        uniqueHeroTag: "cameraNavBar",
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _cameraPreviewWidget(),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _cameraTogglesRowWidget(),
                  _captureControlRowWidget(context),
                  Spacer()
                ],
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
          setState(() {
            selectedCameraIdx = 0;
          });
          _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        _showErroDialog(
            this.context,
            "Erro",
            "Não existe câmeras disponíveis");
      }
    }).catchError((err) {
      _showErroDialog(
          this.context,
          "Erro",
          "Não foi possível acessar as câmeras"
        ,);
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
        _showErroDialog(
          this.context,
          "Erro",
          controller.value.errorDescription,
        );
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showErroDialog(
        this.context,
        "Erro - ${e.code}",
        e.description,
      );
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  Widget _captureControlRowWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
                child: Icon(Icons.camera),
                backgroundColor: Colors.blueGrey,
                onPressed: () {
                  _onCapturePressed(context);
                })
          ],
        ),
      ),
    );
  }

  Widget _cameraTogglesRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,
            icon: Icon(_getCameraLensIcon(lensDirection)),
            label: Text(
                "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _initCameraController(selectedCamera);
  }

  void _onCapturePressed(context) async {
    try {
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await controller.takePicture(path);

      _pushToCorrectPresentation(context, false, PreviewImageScreen(imagePath: path));

    } catch (e) {
      _showErroDialog(
        this.context,
        "Erro - ${e.code}",
        e.description,
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

  _showErroDialog(BuildContext context, String title, String menssage) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );

    AlertDialog alerta = AlertDialog(
      title: Text(title),
      content: Text(menssage),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}

