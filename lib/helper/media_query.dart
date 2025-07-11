import 'package:flutter/material.dart';

double mediaQueryHeight(BuildContext context, {required double height}) =>
      MediaQuery.of(context).size.height * height;

double mediaQueryWidth(BuildContext context, {required double width}) =>
      MediaQuery.of(context).size.width * width;

double mediaQuerySubWidth(BuildContext context, {required double width}) =>
      MediaQuery.of(context).size.width - width;

double mediaQueryAddWidth(BuildContext context, {required double width}) =>
      MediaQuery.of(context).size.width + width;

