import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme/theme.dart';

import '../const/assets.dart';

class Moment {
  final String text;
  final DateTime date;
  final Widget icon;
  final bool isShowIcon;

  Moment({
    required this.text,
    required this.date,
    required this.icon,
    required this.isShowIcon,
  });
}

final List<Moment> items = [
  Moment(
    text: "Today",
    date: DateTime.now(),
    isShowIcon: false,
    icon: SvgPicture.asset(
      Assets.datetime,
      color: AppColors.primaryIconColors,
      height: 14,
    ),
  ),
  Moment(
    text: "Tommorrow",
    date: DateTime.now(),
    isShowIcon: false,
    icon: SvgPicture.asset(
      Assets.datetime,
      color: AppColors.primaryIconColors,
      height: 14,
    ),
  ),
  Moment(
    text: "No date",
    date: DateTime.now(),
    isShowIcon: true,
    icon: SvgPicture.asset(
      Assets.nodate,
      color: AppColors.primaryIconColors,
      height: 14,
    ),
  ),
];
