import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'personal_profile_state.dart';

class PersonalProfileCubit extends Cubit<PersonalProfileState> {
  PersonalProfileCubit()
    : super(
        const PersonalProfileState(
          username: 'Zeyad',
          phone: '770394997',
          isDarkMode: false,
          language: 'engilsh',
        ),
      ) {
    _loadProfile(); // نحمل البيانات المحفوظة عند البداية
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? state.username;
    final phone = prefs.getString('phone') ?? state.phone;
    final isDarkMode = prefs.getBool('isDarkMode') ?? state.isDarkMode;
    final language = prefs.getString('language') ?? state.language;
    final imagePath = prefs.getString('profileImage');
    final imageFile = imagePath != null ? File(imagePath) : null;

    emit(
      state.copyWith(
        username: username,
        phone: phone,
        isDarkMode: isDarkMode,
        language: language,
        profileImage: imageFile,
      ),
    );
  }

  void updateUsername(String name) async {
    emit(state.copyWith(username: name));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
  }

  void updatePhoneNumber(String phone) async {
    emit(state.copyWith(phone: phone));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
  }

  void updateImage(File image) async {
    emit(state.copyWith(profileImage: image));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', image.path); // نحفظ فقط المسار
  }

  void toggleDarkMode(bool value) async {
    emit(state.copyWith(isDarkMode: value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  void changeLanguage(String lang) async {
    emit(state.copyWith(language: lang));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  void resetProfile() async {
    emit(
      const PersonalProfileState(
        username: "Zeyad",
        phone: "770394997",
        profileImage: null,
        isDarkMode: false,
        language: "العربية",
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
