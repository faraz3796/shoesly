
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class FilterColor extends StatelessWidget {
  const FilterColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Color', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(width: 1, color: ColorUtils.blackColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: ColorUtils.blackColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1, color: ColorUtils.lightGreyColor)),
                    ),
                    SpaceUtils.horizontalSpace(8),
                    TextUtils.text('Black',
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
