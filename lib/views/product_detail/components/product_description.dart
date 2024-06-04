import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 315.w,
          child: TextUtils.text('Description',
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: TextUtils.text(
              product.description,
              fontSize: 14,
              color: ColorUtils.greyColor),
        ),
      ],
    );
  }
}
