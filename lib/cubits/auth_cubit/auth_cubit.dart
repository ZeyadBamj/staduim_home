import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthMode { login, register }

class AuthCubit extends Cubit<AuthMode> {
  AuthCubit() : super(AuthMode.login);

  void showLogin() => emit(AuthMode.login);
  void showRegister() => emit(AuthMode.register);
}
