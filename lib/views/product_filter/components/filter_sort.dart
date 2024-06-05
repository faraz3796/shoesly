
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class FilterSort extends StatelessWidget {
  const FilterSort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Sort By', fontSize: 16, fontWeight: FontWeight.w600),
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
                    border:
                    Border.all(width: 1, color: ColorUtils.lightGreyColor)),
                child: TextUtils.text('Most recent',
                    fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}
