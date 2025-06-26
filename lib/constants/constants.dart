import 'package:flutter/material.dart';

const kPrimaryGreen = Color(0xFF66BB6A);

const kTextDark = Color(0xFF212121);

const kTextLight = Color(0xFF757575);

const kBorderColor = Color(0xFFE0E0E0);

const kBackgroundLight = Color(0xFFF5F5F5);

const kWhiteColor = Colors.white;

const kGreenColor = Colors.green;

const kGreyColor = Colors.grey;

const kBlueColor = Colors.blue;

const kRedColor = Colors.red;

const kBlackColor = Colors.black;

const kEnamImage = 'assets/images/enma_staduim.jpg';

const kPrimaryColor = Color(0xFF00A651);

const kIconImage = 'assets/images/soccer-field.png';

const kGoogleIcon = 'assets/images/search.png';

const kFacebookIcon = 'assets/images/facebook.png';

const kXIcon = 'assets/images/x.png';

Shadow kShadow({
  required Color color,
  required double blurRadius,
  Offset offSet = const Offset(0, 0),
}) {
  final shadow = Shadow(color: color, blurRadius: blurRadius, offset: offSet);
  return shadow;
}
