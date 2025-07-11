import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';

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
    if (count == null || count < 1) return;

    setState(() {
      sizeControllers = List.generate(count, (_) => TextEditingController());
      capacityControllers = List.generate(
        count,
        (_) => [TextEditingController(), TextEditingController()],
      );
    });
  }

  String? _capacityValidator(String? value) {
    if (value == null || value.isEmpty) return 'مطلوب';
    final number = int.tryParse(value);
    if (number == null || number < 4 || number > 11) return 'بين 4 و 11';
    return null;
  }

  InputDecoration customInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: kGreenColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: kPrimaryColor, width: 3),
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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: TextFormField(
              controller: fieldsCountController,
              keyboardType: TextInputType.number,
              decoration: customInputDecoration(
                hintText: 'مثال: 1، 2، 3....هذه ارقام عربية، ضع أحدها ',
              ),
              onChanged: _updateFields,
            ),
          ),
          const SizedBox(height: 20),

          for (int i = 0; i < sizeControllers.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("حجم الملعب ${i + 1} :", style: OwnerInputStyle.kFieldNumSize),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: TextFormField(
                    controller: sizeControllers[i],
                    decoration: customInputDecoration(
                      hintText: 'مثلاً: صغير، وسط، كبير',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text("كم يتسع الملعب ${i + 1} :", style: OwnerInputStyle.kFieldNumSize),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: TextFormField(
                          controller: capacityControllers[i][0],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          validator: _capacityValidator,
                          decoration: customInputDecoration(hintText: '7'),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("✕", style: TextStyle(fontSize: 24)),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: TextFormField(
                          controller: capacityControllers[i][1],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          validator: _capacityValidator,
                          decoration: customInputDecoration(hintText: '7'),
                        ),
                      ),
                    ),
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
