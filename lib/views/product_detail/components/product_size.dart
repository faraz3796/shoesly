import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';

import '../../../controllers/product_details_controller.dart';

class ProductSize extends StatelessWidget {
  ProductSize({
    super.key,
    required this.product,
  });

  final Product product;
  final controller = Get.find<ProductDetailsController>();

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

  Widget sizeOption(String size) {
    return Obx(() => InkWell(
      onTap: (){
        controller.selectedSize.value = size;
      },
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.selectedSize.value == size
                  ? ColorUtils.blackColor
                  : Colors.transparent,
              border: Border.all(
                  width: 1.w,
                  color: controller.selectedSize.value == size
                      ? Colors.transparent
                      : ColorUtils.lightGreyColor),
            ),
            child: TextUtils.text(size, color:controller.selectedSize.value == size? Colors.white :  ColorUtils.greyColor),
          ),
    ));
  }
}
