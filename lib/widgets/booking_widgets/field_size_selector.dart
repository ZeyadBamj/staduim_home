import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class FieldSizeSelector extends StatelessWidget {
  final String? selectedSize;
  final void Function(String) onSizeSelected;

  const FieldSizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  Widget _buildSizeOption(String size, String description) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => onSizeSelected(size),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? kGreenColor.shade100 : kWhiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? kGreenColor : kGreyColor,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  size,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? kGreenColor : kBlackColor,
                  ),
                ),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12, color: kBlackColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
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
        _buildSizeOption(
          '7x7',
          'الملعب الكبير',
        ), // يمكن إضافة وصف إذا لزم الأمر
        _buildSizeOption(
          '6x6',
          'الملعب الصغير',
        ), // يمكن إضافة وصف إذا لزم الأمر
      ],
    );
  }
}
