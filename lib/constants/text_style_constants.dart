import 'package:flutter/widgets.dart';
import 'package:reservision_app/constants/constants.dart';

class MainStyle {
  static const kMainText = TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const kGreetingText = TextStyle(fontSize: 24, color: kPrimaryColor);
}

class OwnerControlStyle {
  static const kSnackBar = TextStyle(color: kWhiteColor, fontSize: 18);
  static const kAddPeriod = TextStyle(color: kBlueColor, fontSize: 16);
}

class OwnerDetailsStyle {
  static const kTextField = TextStyle(fontSize: 18, color: kBlackColor);
}

class OwnerInputStyle {
  static const kFieldNumSize = TextStyle(fontSize: 16, color: kBlackColor);
}

class ShowConfirmDialogStyle {
  static const kYes = TextStyle(
    color: kRedColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const kNo = TextStyle(color: kWhiteColor);

  static const kContent = TextStyle(fontSize: 18);
}

class ExitTextStyle {
  static final kExitText = TextStyle(
    color: kRedColor,
    fontWeight: FontWeight.bold,
    shadows: [kShadow(color: kRedColor, blurRadius: 3)],
  );
}

class MyDrawerStyle {
  static const kIcon = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}

class DetailsStyle {
  static const kText = TextStyle(
    fontSize: 18,
    letterSpacing: 1,
    wordSpacing: 1,
  );
}

class BookingDetailsStyle {
  static const kDetails = TextStyle(fontSize: 18);
}
