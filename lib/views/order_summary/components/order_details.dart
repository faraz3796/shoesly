
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/views/order_summary/components/order_product_tile.dart';

import '../../../controllers/cart_controller.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class OrderDetail extends StatelessWidget {
   OrderDetail({
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
          TextUtils.text('Order Detail',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
          for (int i = 0; i < controller.cartItems.length; i++)
            OrderProductTile(cart: controller.cartItems[i]),
          SpaceUtils.verticalSpace(15),

        ],
      ),
    );
  }

}
