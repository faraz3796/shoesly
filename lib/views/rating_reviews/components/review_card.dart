import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.0.h),
      child: SizedBox(
        width: 315.w,
        child: Column(
          children: [
            Container(
              width: 315.w,
              //height: 45.h,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorUtils.lightGreyColor),
                  ),
                  SpaceUtils.horizontalSpace(10),
                  userInfoAndRating()
                ],
              ),
            ),
            SpaceUtils.verticalSpace(10),
            Container(
              margin: EdgeInsets.only(left: 40.w),
              width: 259.w,
              child: TextUtils.text(
                'Perfect for keeping your feet dry and warm in damp conditions. ',
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  Column userInfoAndRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceUtils.verticalSpace(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200.w,
              child: TextUtils.text('Faraz Ahmed', fontWeight: FontWeight.bold),
            ),
            TextUtils.text('Today',
                fontSize: 12, color: ColorUtils.lightGreyColor)
          ],
        ),
        SpaceUtils.verticalSpace(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 5; i++)
              SvgPicture.asset(
                'assets/svgs/star.svg',
                width: 12.w,
                height: 12.h,
              )
          ],
        ),
      ],
    );
  }
}
