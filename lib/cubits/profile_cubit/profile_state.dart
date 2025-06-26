import 'package:equatable/equatable.dart';
import 'dart:io';

class ProfileState extends Equatable {
  final String username;
  final String email;
  final File? profileImage;
  final bool isDarkMode;
  final String language;

  const ProfileState({
    required this.username,
    required this.email,
    this.profileImage,
    required this.isDarkMode,
    required this.language,
  });

  ProfileState copyWith({
    String? username,
    String? email,
    File? profileImage,
    bool? isDarkMode,
    String? language,
  }) {
    return ProfileState(
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [username, email, profileImage, isDarkMode, language];
}
