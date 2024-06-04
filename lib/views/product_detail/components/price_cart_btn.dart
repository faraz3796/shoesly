import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/product_detail/components/item_quantity_sheet.dart';

class ProductPriceAndCartBtn extends StatelessWidget {
  const ProductPriceAndCartBtn({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.width.w,
      height: 90.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils.text('Price',
                  fontSize: 12, color: ColorUtils.lightGreyColor),
              SpaceUtils.verticalSpace(4),
              TextUtils.text('\$${product.price}',
                  fontSize: 20, fontWeight: FontWeight.bold),
            ],
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.transparent, ItemQuantitySheet());
            },
            child: Container(
              height: 50.h,
              width: 156.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: ColorUtils.blackColor),
              child: TextUtils.text('ADD TO CART',
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
