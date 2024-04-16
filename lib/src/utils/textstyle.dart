import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DesignColors {
  static dynamic itemBorder = const Color(0xFFEBF0FF);
  static dynamic bodyTextColor = const Color(0xFF656975);
  static dynamic titleTextColor = const Color(0xFF383D3D);
  static dynamic ratingColor = const Color(0xFFFFC833);
  static dynamic priceColor = const Color(0xFF0066FF);
  static dynamic menuSelected = const Color(0xFF0066FF);
  static dynamic discountColor = const Color(0xFFEF473D);
  static dynamic menuDisabledColor = const Color(0xFF9098B1);
  static dynamic placeholder = const Color(0xFF9098B1);
  static dynamic standardBlack = const Color(0xFF383D3D);
  static dynamic black = const Color(0xFF000000);
  static dynamic iconColor = const Color(0XFF383D3D);
}

class DesignDimens {
  static dynamic gap = 4.0.sp;
  static dynamic smallRadius = 8.0.sp;
  static dynamic itemRadius = 10.0.sp;
  static dynamic itemPadding = 12.0.sp;
  static dynamic itemPaddingMedium = 8.0.sp;
  static dynamic itemPaddingGeneric = 12.0.sp;
  static dynamic screenPadding = 16.0;
  static dynamic bannerPadding = 24.0.sp;

  static dynamic textSizeItemTitle = 20.0.sp;
  static dynamic body = 14.0.sp;
  static dynamic bodyLarge = 16.0.sp;
  static dynamic bodyStrong = 16.0.sp;
  static dynamic caption = 14.0.sp;
  static dynamic display = 14.0.sp;
  static dynamic subtitle = 14.0.sp;
  static dynamic title = 16.0.sp;
  static dynamic producttitle = 15.0.sp;
  static dynamic price = 15.0.sp;
  static dynamic titleLarge = 18.0.sp;
  static dynamic standard = 16.0.sp;
  static dynamic standardSmall = 14.0.sp;
  static dynamic iconSize = 24.0.sp;
  static dynamic categoryIconSize = 20.sp;
  static dynamic searchIconSize = 20.0;
  static dynamic selectedRadius = 18.0.sp;
  static dynamic titleBanner = 24.0.sp;
  static dynamic descriptionLarge = 18.sp;
}

class DesignText {
  static ButtonStyle btnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: DesignColors.black,
  );

  static TextStyle linkTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: DesignColors.menuSelected,
  );

  static TextStyle bigTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: DesignColors.black,
  );

  static TextStyle body = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: DesignColors.black,
  );

  static TextStyle bodyItalic = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    fontStyle: FontStyle.italic,
    color: DesignColors.black,
  );

  static TextStyle placeholder = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: DesignColors.standardBlack);

  static TextStyle noItemFound = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.white);
}