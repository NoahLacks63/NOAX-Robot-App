import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AutoLinearProgressIndicator extends StatelessWidget {
  final ValueListenable listenable;

  const AutoLinearProgressIndicator({
    super.key, required this.listenable,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listenable, 
      builder: (context, value, child) {
        return LinearProgressIndicator(
          value: value,
        );
      });
  }
}