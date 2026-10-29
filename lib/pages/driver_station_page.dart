import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gamepad/axes.dart';
import 'package:flutter_application_1/gamepad/buttons.dart';
import 'package:flutter_application_1/gamepad/gamepad.dart';
import 'package:flutter_application_1/gamepad/gamepad_display.dart';
import 'package:flutter_application_1/robot/robot.dart';
import 'package:flutter_application_1/utils/auto_linear_progress_indicator.dart';

class DriverStationPage extends StatelessWidget {
  late final List<Gamepad> gamepads;
  late final List<ValueListenable> valueListenableList;

  DriverStationPage({super.key}) {
    gamepads = [Gamepad('gamepad0')];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 

          // HEADER
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 8
                        )
                      )
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text("Robot: "),
                          ValueListenableBuilder(
                            valueListenable: Robot().isConnected,
                            builder: (context, value, child) {
                              return Text(value ? "Connected" : "Disconnected",);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(1, 10),
                            FlSpot(2, 20),
                            FlSpot(3, 15)
                          ]
                        )
                      ]
                    )
                  )
                )
              ]
            )
          ),

          // Gamepad values display
          Expanded(
            flex: 2,
            child: Row(
              children: [

                // Joysticks
                Expanded(
                  child: Column(
                    children: [
                      GamepadDisplay(
                        label: "Left X: ", 
                        listenable: gamepads[0].axes[Axes.leftX.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                      GamepadDisplay(
                        label: "Left Y: ", 
                        listenable: gamepads[0].axes[Axes.leftY.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                      GamepadDisplay(
                        label: "Right X: ", 
                        listenable: gamepads[0].axes[Axes.rightX.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                      GamepadDisplay(
                        label: "Right Y: ", 
                        listenable: gamepads[0].axes[Axes.rightY.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                      GamepadDisplay(
                        label: "Left Thumbstick: ", 
                        listenable: gamepads[0].buttons[Buttons.thumbL.value]
                      ),
                      GamepadDisplay(
                        label: "Right Thumbstick: ", 
                        listenable: gamepads[0].buttons[Buttons.thumbR.value]
                      )
                    ],
                  ),
                ),

                // Triggers
                Expanded(
                  child: Column(
                    children: [
                      GamepadDisplay(
                        label: "Right Trigger", 
                        listenable: gamepads[0].axes[Axes.rightTrigger.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                      GamepadDisplay(
                        label: "Right Trigger", 
                        listenable: gamepads[0].axes[Axes.rightTrigger.value],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AutoLinearProgressIndicator(
                            listenable: gamepads[0].axes[Axes.leftX.value]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // DPAD
                Expanded(
                  child: Column(
                    children: [
                      GamepadDisplay(
                        label: "DPAD Up: ", 
                        listenable: gamepads[0].buttons[Buttons.dpadUp.value]
                      ),
                      GamepadDisplay(
                        label: "DPAD Down: ", 
                        listenable: gamepads[0].buttons[Buttons.dpadDown.value]
                      ),
                      GamepadDisplay(
                        label: "DPAD Left: ", 
                        listenable: gamepads[0].buttons[Buttons.dpadLeft.value]
                      ),
                      GamepadDisplay(
                        label: "DPAD Right: ", 
                        listenable: gamepads[0].buttons[Buttons.dpadRight.value]
                      )
                    ],
                  ),
                ),

                // Face
                Expanded(
                  child: Column(
                    children: [
                      GamepadDisplay(
                        label: "North: ", 
                        listenable: gamepads[0].buttons[Buttons.north.value]
                      ),
                      GamepadDisplay(
                        label: "South: ", 
                        listenable: gamepads[0].buttons[Buttons.south.value]
                      ),
                      GamepadDisplay(
                        label: "East: ", 
                        listenable: gamepads[0].buttons[Buttons.east.value]
                      ),
                      GamepadDisplay(
                        label: "West: ", 
                        listenable: gamepads[0].buttons[Buttons.west.value]
                      )
                    ],
                  ),
                ),

                // Misc
                Expanded(
                  child: Column(
                    children: [
                      GamepadDisplay(
                        label: "Start: ", 
                        listenable: gamepads[0].buttons[Buttons.start.value]
                      ),
                      GamepadDisplay(
                        label: "Select: ", 
                        listenable: gamepads[0].buttons[Buttons.select.value]
                      ),
                      GamepadDisplay(
                        label: "Mode: ", 
                        listenable: gamepads[0].buttons[Buttons.mode.value]
                      )
                    ],
                  ),
                )
              ],
            )
          ),

          // Footer
          Expanded(
            flex: 2,
            child: ValueListenableBuilder(
              valueListenable: Robot().isEnabled, 
              builder: (context, value, child) {
                return TextButton(
                  onPressed: () => Robot().isEnabled.value = false, 
                  onLongPress: () => Robot().isEnabled.value ? 
                    Robot().isEnabled.value = false : 
                    Robot().isEnabled.value = true,
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder()
                    ),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: 
                      value ? 
                        WidgetStatePropertyAll(
                          Colors.red
                        ) : 
                        WidgetStatePropertyAll(
                          const Color.fromARGB(255, 120, 255, 50)
                        )
                  ),
                  child: SizedBox.expand(
                    child: FittedBox(
                      child: Text(
                        value ? "Disable" : "Enable",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight(500)
                        ),
                      )
                    ),
                  )
                );
              }
            )
          )
        ]
      )
    );
  }  
}