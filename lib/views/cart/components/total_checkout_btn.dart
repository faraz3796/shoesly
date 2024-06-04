import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/cart_controller.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/views/order_summary/order_summary_screen.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class TotalAndCheckoutBn extends StatelessWidget {
   TotalAndCheckoutBn({
    super.key,
  });

  final controller = Get.find<CartController>();

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
            color: Colors.grey.withOpacity(0.5), // shadow color
            spreadRadius: 3, // spread radius
            blurRadius: 2, // blur radius
            offset: Offset(0, 3), // changes position of shadow
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
              TextUtils.text('Grand Total',
                  fontSize: 12, color: ColorUtils.lightGreyColor),
              SpaceUtils.verticalSpace(4),
              Obx(() =>  TextUtils.text('\$${controller.totalPrice.value.toStringAsFixed(2)}',
                  fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(() => OrderSummaryScreen());
            },
            child: Container(
              height: 50.h,
              width: 156.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: ColorUtils.blackColor),
              child: TextUtils.text('Checkout',
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}