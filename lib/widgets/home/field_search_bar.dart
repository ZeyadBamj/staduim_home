import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class FieldSearchBar extends StatelessWidget {
  const FieldSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kGreyColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        // readOnly: true, // Make it read-only to act as a button
        onTap: () {
          print('Search field tapped!');
        },
        decoration: InputDecoration(
          hintText: 'ابحث عن ملعبك ...',
          hintStyle: TextStyle(color: kBorderColor),
          suffixIcon: Icon(Icons.search, color: kTextLight),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: kWhiteColor),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}
