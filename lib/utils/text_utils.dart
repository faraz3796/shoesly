import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/utils/color_utils.dart';

class TextUtils {
  static Widget text(
    String text, {
    double fontSize = 14,
    Color color = ColorUtils.blackColor,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
        TextOverflow overflow = TextOverflow.visible
  }) {
    return Text(
      text,
      textAlign: align,
      overflow:overflow ,
      style: GoogleFonts.urbanist(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
