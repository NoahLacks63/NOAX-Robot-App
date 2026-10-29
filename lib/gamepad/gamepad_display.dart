import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GamepadDisplay extends StatelessWidget {
  final String label;
  final ValueListenable listenable;
  final Widget? child;

  const GamepadDisplay({
    super.key, 
    required this.label, 
    required this.listenable, 
    this.child}
  ) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(label,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: ValueListenableBuilder(
                valueListenable: listenable,
                builder: (context, value, child) {
                  return Text(value.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        ?child
      ]
    );
  }
}