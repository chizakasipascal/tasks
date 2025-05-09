import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/const/assets.dart';
import 'package:theme/theme.dart';

const _duration = Duration(milliseconds: 400);
const _minSize = 50.0;
const _maxSize = 350.0;
const _iconSize = 24.0;

class InputAddTasks extends StatefulWidget {
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
  State<InputAddTasks> createState() => _InputAddTasksState();
}

class _InputAddTasksState extends State<InputAddTasks> {
  TextEditingController controller = new TextEditingController();
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        width: widget.expanded ? _maxSize : _minSize,
        height: _minSize,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(_minSize),
        ),
        duration: _duration,
        child: Stack(
          children: [
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_minSize),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextField(
                      controller: controller,
                      maxLines: 2,
                      onTap: () {},
                      onChanged: (value) {
                        debugPrint("Value $value");
                        debugPrint("controller ${controller.text}");
                        if (value.isEmpty) {
                          setState(() {
                            isEmpty = true;
                          });
                          debugPrint("isEmpty");
                        } else {
                          setState(() {
                            isEmpty = false;
                          });
                          debugPrint("isEmpty false");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "What can I do for you?",
                        fillColor: AppColors.inputBackgroundColor,
                        hintStyle: AppTypography().body.copyWith(
                              color: AppColors.black.withOpacity(0.5),
                            ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            widget.expanded
                ? Positioned(
                    right: position,
                    top: widget.expanded ? 0 : position,
                    child: InkWell(
                      onTap: () {
                        debugPrint("Tapped");
                        debugPrint("controller ${controller.text}");
                      },
                      child: Container(
                        height: _iconSize + 25,
                        width: _iconSize + 25,
                        decoration: BoxDecoration(
                          color: isEmpty
                              ? AppColors.primary.withOpacity(.5)
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(_iconSize),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: widget.onTap,
                    child: Container(
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
                  ),
          ],
        ),
      ),
    );
  }
}
