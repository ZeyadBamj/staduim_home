import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileMode { login, register }

class ProfileCubit extends Cubit<ProfileMode> {
  ProfileCubit() : super(ProfileMode.login);

  void showLogin() => emit(ProfileMode.login);
  void showRegister() => emit(ProfileMode.register);
}
