import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import '../../Models/Character.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
    required this.opacity,
    required this.scale,
    required this.itemSize,
    required this.charter,
    required this.onTap,
  });

  final double opacity;
  final double scale;
  final double itemSize;
  final Character charter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        heightFactor: 0.5,
        child: Opacity(
          opacity: opacity,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(scale, 1.0),
            child: SizedBox(
              height: itemSize,
              child: SizedBox(
                child: Center(
                  child: ListTile(
                    trailing: Icon(charter.icon),
                    title: Text(charter.text),
                    subtitle: Text(charter.date.toString()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
