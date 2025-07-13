import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff157D1A);

const kBorderColor = Color(0xFFE0E0E0);

const kWhiteColor = Colors.white;

const kGreenColor = Colors.green;

const kGreyColor = Colors.grey;

const kBlueColor = Colors.blue;

const kRedColor = Colors.red;

const kBlackColor = Colors.black;

const kYellowColor = Colors.yellow;

const kOrangeColor = Colors.orange;

const kTransparentColor = Colors.transparent;

Shadow kShadow({
  required Color color,
  required double blurRadius,
  Offset offSet = const Offset(0, 0),
}) {
  final shadow = Shadow(color: color, blurRadius: blurRadius, offset: offSet);
  return shadow;
}
