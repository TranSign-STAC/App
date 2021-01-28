import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CameraControllers extends StatefulWidget {
  CameraControllers({
    Key key,
    @required this.onReverseCameraButtonPressed,
    @required this.onFlashButtonPressed,
    @required this.onRecordButtonPressed,
    @required this.onRecordStopped,
  }) : super(key: key);
  final VoidCallback onReverseCameraButtonPressed;
  final VoidCallback onFlashButtonPressed;
  final VoidCallback onRecordButtonPressed;
  final VoidCallback onRecordStopped;
  _CameraControllersState createState() => _CameraControllersState();
}

class _CameraControllersState extends State<CameraControllers> {
  bool recordingEnabled = false;
  @override
  Widget build(BuildContext context) {
    Container normalRecordButton = Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 8),
        shape: BoxShape.circle,
      ),
    );
    Container workingRecordButton = Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 8),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.stop,
        size: 32,
        color: Colors.white,
      ),
    );

    Widget reverseCameraButton = GestureDetector(
        onTap: widget.onReverseCameraButtonPressed,
        child: SvgPicture.asset("assets/images/reverse_camera.svg"));
    Widget recordButton = GestureDetector(
      onTap: () {
        this.recordingEnabled
            ? widget.onRecordStopped()
            : widget.onRecordButtonPressed();
        this.setState(() {
          this.recordingEnabled = !this.recordingEnabled;
        });
      },
      child: this.recordingEnabled ? workingRecordButton : normalRecordButton,
    );
    Widget flashButton = GestureDetector(
      onTap: widget.onFlashButtonPressed,
      child: SvgPicture.asset("assets/images/flash.svg"),
    );
    return Container(
      height: MediaQuery.of(context).padding.bottom + 144,
      width: MediaQuery.of(context).size.width,
      color: TransignColors.PrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          reverseCameraButton,
          recordButton,
          flashButton,
        ],
      ),
    );
  }
}
