import 'package:equatable/equatable.dart';
import 'dart:io';

class ProfileState extends Equatable {
  final String username;
  final String phone;
  final File? profileImage;
  final bool isDarkMode;
  final String language;

  const ProfileState({
    required this.username,
    required this.phone,
    this.profileImage,
    required this.isDarkMode,
    required this.language,
  });

  ProfileState copyWith({
    String? username,
    String? phone,
    File? profileImage,
    bool? isDarkMode,
    String? language,
  }) {
    return ProfileState(
      username: username ?? this.username,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [username, phone, profileImage, isDarkMode, language];
}
