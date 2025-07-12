import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservision_app/cubits/personal_profile_cubit/personal_profile_cubit.dart';

Future<void> pickImageFunction(BuildContext context) async {
  final cubit = context.read<PersonalProfileCubit>();
  final picker = ImagePicker();
  final picked = await picker.pickImage(source: ImageSource.gallery);
  if (picked != null) {
    cubit.updateImage(File(picked.path));
  }
}
