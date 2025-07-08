import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_state.dart';
import 'package:reservision_app/screens/profile_screen.dart';
import 'package:reservision_app/widgets/common/custom_app_bar.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/profile_widgets/editable_list_tile.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_functions/edit_field_function.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_functions/pick_image_function.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_functions/show_full_image_function.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_image_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(title: Text('الحساب الشخصي'), centerTitle: true),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: ProfileImageWidget(
                  imageFile: state.profileImage,
                  onTap: () {
                    print('تم الضغط على الصورة');
                    showFullImage(context, state.profileImage);
                  },
                  onEdit: () => pickImageFunction(context),
                ),
              ),
              const SizedBox(height: 20),
              EditableListTile(
                title: "الاسم",
                value: state.username,
                icon: Icons.person,
                onEdit:
                    () => editFieldFunction(
                      context: context,
                      title: "تعديل الاسم",
                      initialValue: state.username,
                      onSave:
                          (value) => context
                              .read<ProfileCubit>()
                              .updateUsername(value),
                    ),
              ),
              EditableListTile(
                title: "رقم الجوال",
                value: state.phone,
                icon: FontAwesomeIcons.mobileButton,
                onEdit:
                    () => editFieldFunction(
                      context: context,
                      title: "تعديل رقم الجوال",
                      initialValue: state.phone,
                      onSave:
                          (value) => context
                              .read<ProfileCubit>()
                              .updatePhoneNumber(value),
                    ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("تسجيل الخروج"),
                onTap: () {
                  context.read<LoginStatusCubit>().logOut();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
