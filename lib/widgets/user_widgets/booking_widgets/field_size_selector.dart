import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';

class FieldSizeSelector extends StatelessWidget {
  final String? selectedSize;
  final void Function(String) onSizeSelected;

  const FieldSizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  Widget _buildSizeOption(String size) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => onSizeSelected(size),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 100,
            child: Card(
              elevation: isSelected ? 5 : 0,
              color: isSelected ? kGreenColor.shade200 : kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: isSelected ? kGreenColor : kGreyColor,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    size,
                    style: TextStyle(
                      fontSize: isSelected ? 18 : 16,
                      color: isSelected ? kGreenColor : kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSizeOption('الكبير'), // يمكن إضافة وصف إذا لزم الأمر
        _buildSizeOption('الصغير'), // يمكن إضافة وصف إذا لزم الأمر
      ],
    );
  }
}
