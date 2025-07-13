import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';

class PeriodSelector extends StatelessWidget {
  final String? selectedPeriod;
  final void Function(String) onPeriodSelected;

  const PeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodSelected,
  });

  final List<String> _periods = const [
    '6:30 م الى 8:30 م',
    '8:30 م الى 10:30 م.',
    '10:30 م الى 12:30 ص',
    '12:30 ص إلى 2:30 ص',
  ];

  Widget _buildPeriodOption(String period) {
    final isSelected = selectedPeriod == period;
    return GestureDetector(
      onTap: () => onPeriodSelected(period),
      child: Card(
        elevation: isSelected ? 5 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? kGreenColor.shade100 : kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? kGreenColor : kGreyColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  period,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? kPrimaryColor : kBlackColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: kPrimaryColor, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250, // الحد الأقصى لعرض كل عنصر
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.2, // نسبة العرض للطول
          ),
          itemCount: _periods.length,
          itemBuilder: (context, index) {
            final period = _periods[index];
            return _buildPeriodOption(period);
          },
        ),
      ],
    );
  }
}
