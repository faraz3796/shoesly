import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class OrderPaymentDetail extends StatelessWidget {
   OrderPaymentDetail({
    super.key,
  });

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text('Payment Detail',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
         Obx(() =>  infoTile('Sub Total', '\$${controller.totalPrice.value}')),
          SpaceUtils.verticalSpace(15),
          infoTile('Shipping',  '\$40'),
          SpaceUtils.verticalSpace(8),
          Divider(color: ColorUtils.productBackground,),
          SpaceUtils.verticalSpace(8),
          Obx(() =>  infoTile('Total Order', '\$${controller.totalPrice.value + 40}'))
        ],
      ),
    );
  }
  Widget infoTile(String title,  String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 200.w,
            child: TextUtils.text(title, color: ColorUtils.lightGreyColor)),
        Container(
            alignment: Alignment.centerRight,
            width: 100.w,
            child: TextUtils.text(price, fontWeight: FontWeight.bold)),

      ],
    );
  }
}
