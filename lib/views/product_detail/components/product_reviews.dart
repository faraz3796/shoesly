import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';
import '../../rating_reviews/components/review_card.dart';
import '../../rating_reviews/rating_reviews_screen.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 315.w,
          child: TextUtils.text('Review (1045)', fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SpaceUtils.verticalSpace(8),
        ProductReviewCard(),
        SpaceUtils.verticalSpace(20),
        InkWell(
          onTap: (){
            Get.to(() => RatingAndReviewsScreen());
          },
          child: Container(
            width: 315.w,
            height: 50.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: 1.w, color: ColorUtils.lightGreyColor)
            ),
            child: TextUtils.text('See All Review', fontWeight: FontWeight.bold),
          ),
        )

      ],
    );
  }
}

