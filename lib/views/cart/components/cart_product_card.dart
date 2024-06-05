import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/cart_controller.dart';
import 'package:shoesly/controllers/discover_controller.dart';
import 'package:shoesly/models/brandModel.dart';
import 'package:shoesly/models/cart_model.dart';
import 'package:shoesly/models/product_model.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({
    super.key,
    required this.cart,
  });

  final CartModel cart;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  RxInt quantity = 1.obs;
  late Product product;
  late BrandModel brand;
  final discoverController = Get.find<DiscoverController>();
  final controller = Get.find<CartController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      quantity.value = widget.cart.quantity;
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.totalPrice.value =
          controller.totalPrice.value + (product.price * quantity.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0.h),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          dragDismissible: false,
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) async {
                controller.cartItems.remove(widget.cart);
                controller.totalPrice.value = controller.totalPrice.value - (product.price * quantity.value);
                await controller.removeCartItem(widget.cart);
              },
              backgroundColor: ColorUtils.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r)),
            ),
          ],
        ),
        child: SizedBox(
          width: 315.w,
          child: Row(
            children: [
              Container(
                width: 88.w,
                height: 88.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorUtils.productBackground),
                child: SizedBox(
                  width: 70.w,
                  height: 50.h,
                  child: CachedNetworkImage(
                    imageUrl: product.images[0],
                  ),
                ),
              ),
              SpaceUtils.horizontalSpace(15),
              SizedBox(
                width: 212.w,
                height: 88.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils.text(
                      product.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpaceUtils.verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtils.text('${brand.title} . ${widget.cart.size}',
                            fontSize: 12, color: ColorUtils.lightGreyColor),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Color(int.parse('0xff${widget.cart.color}'))),
                        ),
                      ],
                    ),
                    SpaceUtils.verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 110.w,
                          child: Obx(() =>  TextUtils.text('\$${(product.price * quantity.value).toStringAsFixed(2)}',
                              fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 90.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if(quantity.value > 1) {
                                    quantity --;
                                    controller.totalPrice.value = controller.totalPrice.value - product.price;
                                    await controller.updateProductQuantity(product.id, quantity.value);
                                  }
                                },
                                child: Obx(() =>   Icon(
                                  Icons.remove_circle_outline_outlined,
                                  size: 24.sp,
                                  color: quantity.value > 1 ? ColorUtils.blackColor : ColorUtils.lightGreyColor,
                                )),
                              ),
                              SpaceUtils.horizontalSpace(8),
                              Obx(() => TextUtils.text('${quantity.value}',
                                  fontWeight: FontWeight.bold)),
                              SpaceUtils.horizontalSpace(8),
                              InkWell(
                                onTap: () async {
                                  quantity.value ++;
                                  controller.totalPrice.value = controller.totalPrice.value + product.price;
                                  await controller.updateProductQuantity(product.id, quantity.value);
                                },
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
