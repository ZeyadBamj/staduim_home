import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/helper/custom_border.dart';

class OwnerPlaygroundInput extends StatefulWidget {
  const OwnerPlaygroundInput({super.key});

  @override
  State<OwnerPlaygroundInput> createState() => _OwnerPlaygroundInputState();
}

class _OwnerPlaygroundInputState extends State<OwnerPlaygroundInput> {
  final TextEditingController fieldsCountController = TextEditingController();
  List<TextEditingController> sizeControllers = [];
  List<List<TextEditingController>> capacityControllers = [];

  void _updateFields(String value) {
    final count = int.tryParse(value);

    if (count == null || count < 1) {
      setState(() {
        sizeControllers.clear();
        capacityControllers.clear();
      });
      return;
    }

    if (count > 5) {
      // إظهار رسالة تنبيه للمستخدم
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الحد الأقصى لعدد الملاعب هو 5'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    final limitedCount = count.clamp(1, 5);

    setState(() {
      while (sizeControllers.length < limitedCount) {
        sizeControllers.add(TextEditingController());
        capacityControllers.add([
          TextEditingController(),
          TextEditingController(),
        ]);
      }

      while (sizeControllers.length > limitedCount) {
        sizeControllers.removeLast().dispose();
        final lastCapacity = capacityControllers.removeLast();
        lastCapacity[0].dispose();
        lastCapacity[1].dispose();
      }
    });
  }

  @override
  void dispose() {
    fieldsCountController.dispose();
    for (var c in sizeControllers) {
      c.dispose();
    }
    for (var list in capacityControllers) {
      for (var c in list) {
        c.dispose();
      }
    }
    super.dispose();
  }

  String? _capacityValidator(String? value) {
    if (value == null || value.isEmpty) return 'مطلوب';
    final number = int.tryParse(value);
    if (number == null || number < 4 || number > 11) return 'بين 4 و 11';
    return null;
  }

  Card customCardNum(int i, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 5,
      child: TextFormField(
        controller: capacityControllers[i][index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        validator: _capacityValidator,
        decoration: InputDecoration(
          hintText: '7',
          enabledBorder: customBorder(color: kGreenColor, width: 2),
          focusedBorder: customBorder(color: kPrimaryColor, width: 3),
        ),
      ),
    );
  }

  Card customCard({
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String hintText,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 5,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: customBorder(color: kGreenColor, width: 2),
          focusedBorder: customBorder(color: kPrimaryColor, width: 3),
        ),
        onChanged: _updateFields,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('عدد الملاعب :', style: OwnerInputStyle.kFieldNumSize),
          customCard(
            controller: fieldsCountController,
            keyboardType: TextInputType.number,
            hintText: 'مثال: 1, 2, 3....استخدم هذه الأرقام العربية.',
          ),
          const SizedBox(height: 20),

          for (int i = 0; i < sizeControllers.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "حجم الملعب ${i + 1} :",
                  style: OwnerInputStyle.kFieldNumSize,
                ),
                customCard(
                  controller: sizeControllers[i],
                  keyboardType: TextInputType.name,
                  hintText: 'مثال: صغير، وسط، كبير',
                ),
                const SizedBox(height: 10),
                Text(
                  "كم يتسع الملعب ${i + 1} :",
                  style: OwnerInputStyle.kFieldNumSize,
                ),
                Row(
                  children: [
                    Expanded(child: customCardNum(i, 0)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("✕", style: TextStyle(fontSize: 24)),
                    ),
                    Expanded(child: customCardNum(i, 1)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
        ],
      ),
    );
  }
}
