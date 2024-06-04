import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/rating_reviews/components/review_card.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';

import '../../utils/color_utils.dart';
import '../../utils/size_utils.dart';

class RatingAndReviewsScreen extends StatefulWidget {
  const RatingAndReviewsScreen({super.key});

  @override
  State<RatingAndReviewsScreen> createState() => _RatingAndReviewsScreenState();
}

class _RatingAndReviewsScreenState extends State<RatingAndReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: CustomTopBar(
        title: TextUtils.text('Review (1045)', fontSize: 16, fontWeight: FontWeight.w600),
        action: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/svgs/star.svg', width: 20.w, height: 20.h,),
            SpaceUtils.horizontalSpace(3),
            TextUtils.text('4.5', fontWeight: FontWeight.bold)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric( horizontal:  25.0.w),
        child: Column(

          children: [
            SpaceUtils.verticalSpace(20),
            Center(
              child: SizedBox(
                width: 315.w,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.w),
                      child: TextUtils.text('All',
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextUtils.text('5 Stars',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.lightGreyColor)
                  ],
                ),
              ),
            ),
            SpaceUtils.verticalSpace(30),
            for(int i =0; i< 4; i++)
              ProductReviewCard(),
          ],
        ),
      ),
    ));
  }
}
