import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/const/assets.dart';
import 'package:theme/theme.dart';

class BodyModalSheet extends StatelessWidget {
  const BodyModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: 50,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(top: 10),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*
                  Row(
                    children: [
                      BackButton(
                        color: AppColors.primary,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Edit task",
                        style: AppTypography().appbarSecondTitle.copyWith(
                              color: AppColors.primary,
                            ),
                      ),
                    ],
                  ),
                  */
                  Text(
                    "Edit task",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.transparent,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text("Edit task", style: AppTypography().appbarTitle),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text("Delete",
                        style: AppTypography().appbarSecondTitle),
                  ),
                ],
              ),
              // SizedBox(height: kTextTabBarHeight),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: (v) {}, groupValue: (g) {}, onChanged: (o) {}),
                      Text(
                        "Start the settings screen dev",
                        style: AppTypography().body,
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 89,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackgroundColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.datetime,
                          color: AppColors.successColor,
                          height: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Today",
                          style: AppTypography().button,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: AppColors.inputBackgroundColor,
                height: 1,
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add, color: AppColors.black, size: 20),
                    // Text("Add subtask", style: AppTypography().sectionTitle),
                    Flexible(
                      child: TextFormField(
                        initialValue: "Add subtask",
                        autofocus: true,
                        autocorrect: false,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.newline,
                        focusNode: FocusNode(),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) {},
                        style: AppTypography().body,
                        cursorColor: AppColors.primary,
                        cursorHeight: 20,
                        cursorWidth: 2,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.start,
                        showCursor: true,
                        readOnly: false,
                        expands: false,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 20,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
