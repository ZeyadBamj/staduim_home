import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class EditableListTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onEdit;

  const EditableListTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: kBlackColor,
      ),
      title: Text('${title} :', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
    );
  }
}
