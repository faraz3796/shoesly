import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../controllers/discover_controller.dart';
import '../../../models/brandModel.dart';
import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class OrderProductTile extends StatefulWidget {
  const OrderProductTile({super.key, required this.cart});

  final CartModel cart;

  @override
  State<OrderProductTile> createState() => _OrderProductTileState();
}

class _OrderProductTileState extends State<OrderProductTile> {
  late Product product;
  late BrandModel brand;
  final discoverController = Get.find<DiscoverController>();
  final controller = Get.find<CartController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discoverController.products.forEach((element) {
      if (element.id == widget.cart.productId) {
        product = element;
      }
    });

    discoverController.brands.forEach((element) {
      if (element.id == product.brandId) {
        brand = element;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text(product.name, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 200.w,
                  child: Row(
                    children: [
                      TextUtils.text(
                          '${brand.title} . ${widget.cart.size} . Qty ${widget.cart.quantity}',
                          color: ColorUtils.lightGreyColor),
                      SpaceUtils.horizontalSpace(10),
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            Color(int.parse('0xff${widget.cart.color}'))),
                      ),
                    ],
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  width: 100.w,
                  child: TextUtils.text(
                      (product.price * widget.cart.quantity).toStringAsFixed(2),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
