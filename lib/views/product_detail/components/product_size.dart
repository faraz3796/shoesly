import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 315.w,
            child: TextUtils.text('Size',
                fontSize: 16, fontWeight: FontWeight.w600)),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            children: [
              for (int i = 0; i < product.sizeOptions.length; i++)
                sizeOption(product.sizeOptions[i]),
            ],
          ),
        )
      ],
    );
  }

  Container sizeOption(String size) {
    return Container(
      width: 40.w,
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.w, color: ColorUtils.lightGreyColor),
      ),
      child: TextUtils.text(size, color: ColorUtils.greyColor),
    );
  }
}
