import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gamepad/axes.dart';
import 'package:flutter_application_1/gamepad/buttons.dart';
import 'package:gamepads/gamepads.dart';

class Gamepad {
  String id;

  List<ValueNotifier<bool>> buttons = List.generate(Buttons.values.length, (i) => ValueNotifier<bool>(false));
  List<ValueNotifier<double>> axes = List.generate(Axes.values.length, (i) => ValueNotifier<double>(0.0));

  // constructor
  Gamepad(this.id) {

    // update buttons and axes lists with button data
    Gamepads.normalizedEvents.listen((event) {
      if (event.gamepadId == id) { 
        if (event is GamepadButton) {
          switch (event.button) {
            // buttons
            case GamepadButton.a:
              buttons[Buttons.south.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.b:
              buttons[Buttons.east.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.x:
              buttons[Buttons.west.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.y:
              buttons[Buttons.north.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.leftBumper:
              buttons[Buttons.leftBumper.value].value = event.value == 0 ? false : true  ;
              break;
            case GamepadButton.rightBumper:
              buttons[Buttons.rightBumper.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.back:
              buttons[Buttons.select.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.start:
              buttons[Buttons.start.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.leftStick:
              buttons[Buttons.thumbL.value].value = event.value == 0 ? false : true;
              break;
            case GamepadButton.rightStick:
              buttons[Buttons.thumbR.value].value = event.value == 0 ? false : true;
              break;
            default:
              break;
          }
        } else if (event is GamepadAxis) {
          switch (event.axis) {
            // axes
            case GamepadAxis.leftStickX:
              axes[Axes.leftX.value].value = event.value;
              break;
            case GamepadAxis.leftStickY:
              axes[Axes.leftY.value].value = event.value;
              break;
            case GamepadAxis.rightStickX:
              axes[Axes.rightX.value].value = event.value;
              break;
            case GamepadAxis.rightStickY:
              axes[Axes.rightY.value].value = event.value;
              break;
            case GamepadAxis.leftTrigger:
              axes[Axes.leftTrigger.value].value = event.value;
              break;
            case GamepadAxis.rightTrigger:
              axes[Axes.rightTrigger.value].value = event.value;
              break;
            default:
              break;
          }
        }
      }
    }); // end of event listener
  } // end of constructor

  bool getButton(Buttons button) {
    return buttons[button.value].value;
  }

  double getAxis(Axes axis) {
    return axes[axis.value].value;
  }

  bool getRobotState(){
    return buttons[Buttons.mode.value].value;
  }

  Uint8List packState() {
    final numFlags = Buttons.values.length;
    final numFlagBytes = (numFlags + 7) ~/ 8;

    final numShorts = Axes.values.length;
    final out = Uint8List(numFlagBytes + numShorts * 2);

    // ---- PACK BOOLEAN FLAGS ----
    for (final key in Buttons.values) {
      if (buttons[key.index].value) {
        final i = key.index;
        out[i ~/ 8] |= 1 << (i % 8);
      }
    }

    // ---- PACK SHORTS (little-endian) ----
    final view = ByteData.sublistView(out);
    for (final key in Axes.values) {
      final v = (axes[key.index].value.clamp(-1.0, 1.0) * 32767).round();
      view.setInt16(numFlagBytes + key.index * 2, v, Endian.little);
    }

    return out;
  }
}