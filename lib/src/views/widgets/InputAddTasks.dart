import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/const/assets.dart';
import 'package:theme/theme.dart';

const _duration = Duration(milliseconds: 400);
const _minSize = 50.0;
const _maxSize = 350.0;
const _iconSize = 24.0;

class InputAddTasks extends StatelessWidget {
  const InputAddTasks({
    super.key,
    required this.size,
    this.expanded = false,
    required this.onTap,
  });

  final Size size;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: expanded ? _maxSize : _minSize,
        height: _minSize,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(_minSize),
        ),
        duration: _duration,
        child: Stack(
          children: [
            // Positioned(
            //   right: position + 1.5 * _iconSize,
            //   top: position,
            //   child: Text(
            //     "Input task",
            //     style: TextStyle(fontSize: 18, color: Colors.white),
            //   ),
            // ),
            Container(
              height: _minSize,
              width: _maxSize,
              margin: EdgeInsets.only(right: _iconSize + _minSize - 10),
              decoration: BoxDecoration(
                color: AppColors.inputBackgroundColor,
                borderRadius: BorderRadius.circular(_minSize),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("What can i do for you?"),
                ),
              ),
            ),
            expanded
                ? Positioned(
                    right: position,
                    top: expanded ? 0 : position,
                    child: Container(
                      height: _iconSize + 25,
                      width: _iconSize + 25,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(_iconSize),
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : Container(
                    height: _minSize,
                    width: _minSize,
                    decoration: BoxDecoration(
                      // color: Colors.yellow,
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(_minSize),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: AppColors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
