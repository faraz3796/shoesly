import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceUtils{
  static Widget verticalSpace(double height){
    return SizedBox(
      height: height.h,
    );
  }
  static Widget horizontalSpace(double width){
    return SizedBox(
      width: width.w,
    );
  }
}