import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class SpeedController extends StatefulWidget {
  _SpeedControllerState createState() => _SpeedControllerState();
}

class _SpeedControllerState extends State<SpeedController> {
  double _handlerValue = 10;
  @override
  Widget build(BuildContext context) {
    SvgPicture speedmeterIcon = SvgPicture.asset(
      "assets/images/speedmeter.svg",
      width: 24,
      height: 24,
      fit: BoxFit.cover,
    );
    Text currentSpeedText = Text(
      "${_handlerValue / 10}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
    FlutterSliderHandler sliderThumb = FlutterSliderHandler(
      child: Container(
        decoration: BoxDecoration(
          color: TransignColors.PrimaryColor,
          boxShadow: [
            BoxShadow(
              color: TransignColors.PrimaryColor,
              blurRadius: 10,
            ),
          ],
          shape: BoxShape.circle,
        ),
      ),
    );
    FlutterSliderTrackBar sliderTrackBar = FlutterSliderTrackBar(
      activeTrackBar: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: TransignColors.BlackScale[100],
        ),
      ),
      inactiveTrackBar: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: TransignColors.BlackScale[100],
        ),
      ),
    );
    FlutterSlider slider = FlutterSlider(
      handlerHeight: 24,
      handlerWidth: 24,
      tooltip: FlutterSliderTooltip(disabled: true),
      values: [this._handlerValue],
      handler: sliderThumb,
      trackBar: sliderTrackBar,
      min: 0,
      max: 20,
      onDragging: (_, lowerValue, __) {
        setState(() {
          setState(() {
            this._handlerValue = lowerValue;
          });
        });
      },
    );
    return Row(children: [
      Padding(padding: EdgeInsets.only(left: 16)),
      speedmeterIcon,
      Padding(padding: EdgeInsets.only(left: 8)),
      currentSpeedText,
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: slider,
        ),
      ),
    ]);
  }
}
