import 'package:flutter/material.dart';

OutlineInputBorder customBorder({required Color color, double width = 0}) =>
    OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.circular(24),
    );
