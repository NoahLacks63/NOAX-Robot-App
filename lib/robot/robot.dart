import 'package:flutter/material.dart';
import 'package:flutter_application_1/robot/robot_state.dart';

class Robot {
  static final Robot _instance = Robot._internal();

  // Factory returns the same instance every time
  factory Robot() => _instance;

  // Private constructor: nothing outside this file can call it
  Robot._internal();

  // Your state and methods
  ValueNotifier<bool> isEnabled = ValueNotifier(false);
  ValueNotifier<RobotState> state = ValueNotifier(RobotState.disabled);
  ValueNotifier<bool> isConnected = ValueNotifier(false);

  void setState(RobotState value) {
    isEnabled.value = value != RobotState.disabled;
    state.value = value;
  }
}