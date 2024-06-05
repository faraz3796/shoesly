import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';

class ProductNameRating extends StatelessWidget {
  const ProductNameRating({
    super.key,
    required this.product
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 315.w,
          child: TextUtils.text(product.name,
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: Row(
            children: [
              SizedBox(
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < product.rating; i++)
                      SvgPicture.asset(
                        'assets/svgs/star.svg',
                        width: 12.w,
                        height: 12.h,
                      )
                  ],
                ),
              ),
              SpaceUtils.horizontalSpace(4),
              TextUtils.text('${product.rating}', fontSize: 11, fontWeight: FontWeight.bold),
              SpaceUtils.horizontalSpace(4),
              TextUtils.text('(${product.reviewsNo} Reviews)',
                  fontSize: 11, color: ColorUtils.lightGreyColor),
            ],
          ),
        ),
      ],
    );
  }
}
