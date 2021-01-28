import 'dart:async';

import 'package:app/src/configs/theme.dart';
import 'package:app/src/views/screens/treanslation_result/translation_result.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/translating_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'widgets/camera_controllers.dart';

class CameraScreen extends StatefulWidget {
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  List<CameraDescription> cameras;
  Future<void> _initializeControllerFuture;

  Future<void> _initCamera(CameraDescription description) async {
    if (this.cameras.length > 0) {
      this.controller = CameraController(description, ResolutionPreset.medium);
      this._initializeControllerFuture = this.controller.initialize();
      this.setState(() {});
    }
  }

  void _switchCamera() {
    final lensDirection = this.controller.description.lensDirection;
    CameraDescription newDescription = this.cameras.firstWhere((description) =>
        lensDirection == CameraLensDirection.front
            ? description.lensDirection == CameraLensDirection.back
            : description.lensDirection == CameraLensDirection.front);
    if (newDescription != null) {
      this._initCamera(newDescription);
    }
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then(
      (availableCameras) {
        this.cameras = availableCameras;
        this._initCamera(this.cameras[0]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget cameraPreview = FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? CameraPreview(controller)
              : Center(child: CircularProgressIndicator()),
    );
    return Scaffold(
      appBar: TransignAppBar(
        title: Container(),
        color: TransignColors.PrimaryColor,
        enableBackButton: true,
        enableDarkMode: true,
      ),
      body: Column(
        children: [
          Expanded(child: cameraPreview),
          CameraControllers(
            onReverseCameraButtonPressed: () {
              if (!this.controller.value.isRecordingVideo) {
                this._switchCamera();
              }
            },
            onFlashButtonPressed: () async {
              try {
                await this.controller.setFlashMode(
                    this.controller.value.flashMode == FlashMode.off
                        ? FlashMode.auto
                        : FlashMode.off);
                print(this.controller.value.flashMode);
              } catch (e) {
                print(e);
              }
            },
            onRecordButtonPressed: () async {
              try {
                await this
                    ._initializeControllerFuture; // wait till the camera is initialized
                await this.controller.startVideoRecording();
              } catch (e) {
                print(e);
              }
            },
            onRecordStopped: () async {
              XFile videoFile = await this.controller.stopVideoRecording();
              if (mounted) setState(() {});

              var timer = Timer(Duration(seconds: 1), () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TranslationResultScreen(videoFile.path),
                ));
              } // mimicking request
                  );
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return TranslatingDialog(() {
                      timer.cancel();
                      Navigator.of(context, rootNavigator: true).pop();
                    });
                  });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
