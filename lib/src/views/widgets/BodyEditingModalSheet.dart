import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/const/assets.dart';
import 'package:theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import '../../Models/Moment.dart';

class BodyEditingModalSheet extends StatelessWidget {
  const BodyEditingModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat format1 = DateFormat('EE');
    final DateFormat format2 = DateFormat('MMM');

    final DateTime today = DateTime.now();
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  TextButton(
                    onPressed: () {},
                    child:
                        Text("Choose date", style: AppTypography().appbarTitle),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${format1.format(today)},${DateTime.now().day} ${format2.format(today)} ",
                      style: AppTypography().body,
                    ),
                  ),
                ),
              ),
              Divider(
                color: AppColors.inputBackgroundColor,
                height: 1,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 32,
                width: size.width,
                child: Row(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.inputBackgroundColor,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Row(
                            spacing: 5,
                            children: [
                              items[index].isShowIcon
                                  ? items[index].icon
                                  : SizedBox.shrink(),
                              Center(
                                child: Text(
                                  items[index].text,
                                  style: AppTypography().button.copyWith(
                                        color: AppColors.primaryIconColors,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: AppColors.inputBackgroundColor,
                height: 1,
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                    horizontal: BorderSide(
                      color: AppColors.inputBackgroundColor,
                      width: 1,
                    ),
                  )),
                  child: DatePicker(
                    // initialDate: DateTime.now(),
                    // selectedDate: DateTime.now(),

                    selectedCellTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.white, fontSize: 10),
                    daysOfTheWeekTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.black, fontSize: 10),

                    minDate: DateTime.now(),
                    maxDate: DateTime(2050, 12, 31),
                    initialDate: DateTime.now(),
                    currentDate: DateTime.now(),
                    currentDateDecoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    currentDateTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.white, fontSize: 20),
                    disabledCellsTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.textDisableColor),

                    enabledCellsTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.black, fontSize: 20),
                    initialPickerType: PickerType.days,
                    leadingDateTextStyle: AppTypography()
                        .body
                        .copyWith(color: AppColors.black, fontSize: 20),

                    slidersColor: AppColors.black,
                    highlightColor: AppColors.white,
                    slidersSize: 20,
                    selectedCellDecoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    splashColor: AppColors.primary,
                    splashRadius: 40,
                    onDateSelected: (value) {
                      debugPrint("Selected date: $value");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
