import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/controllers/product_details_controller.dart';
import 'package:shoesly/models/product_model.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';
import 'added_to_cart_sheet.dart';

class ItemQuantitySheet extends StatelessWidget {
  ItemQuantitySheet({
    super.key,
    required this.product,
  });

  final Product product;

  final controller = Get.find<ProductDetailsController>();
  RxBool load = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.h,
      alignment: Alignment.center,
      width: SizeUtils.width.w,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: ColorUtils.scaffoldColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 4.h,
            decoration: BoxDecoration(
                color: ColorUtils.lightGreyColor,
                borderRadius: BorderRadius.circular(10.r)),
          ),
          SpaceUtils.verticalSpace(20),
          Container(
            width: SizeUtils.width.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils.text('Add to cart',
                    fontSize: 20, fontWeight: FontWeight.bold),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 18.sp,
                      color: ColorUtils.blackColor,
                    ))
              ],
            ),
          ),
          SpaceUtils.verticalSpace(5),
          quantityField(),
          SpaceUtils.verticalSpace(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils.text('Price',
                      fontSize: 12, color: ColorUtils.lightGreyColor),
                  SpaceUtils.verticalSpace(4),
                  Obx(() => TextUtils.text(
                      '\$${product.price * controller.quantity.value}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
                ],
              ),
              Obx(() => load.value
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : InkWell(
                      onTap: () async {
                        if (controller.quantity.value < 1 ||
                            controller.quantityController.value.text
                                .trim()
                                .isEmpty) {
                          Get.snackbar('Invalid Quantity',
                              'Quantity must be equal to or greater than 1',
                              backgroundColor: ColorUtils.redColor);
                        } else {
                          print('adding');
                          load.value = true;
                          int res = await controller.sendToCart(product);
                          load.value = false;
                          Get.back();
                          if (res == 200) {
                            Get.bottomSheet(
                                backgroundColor: Colors.transparent,
                                AddedToCartSheet());
                          }
                        }
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
                    )),
            ],
          ),
          SpaceUtils.verticalSpace(20)
        ],
      ),
    );
  }

  SizedBox quantityField() {
    return SizedBox(
      width: SizeUtils.width.w,
      child: Obx(() => TextFormField(
            controller: controller.quantityController.value,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            cursorColor: ColorUtils.blackColor,
            style: GoogleFonts.urbanist(),
            onChanged: (v) {
              controller.quantity.value = int.parse(v);
              controller.quantityController.value.text = v;
            },
            decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.quantity.value <= 1 ||
                            controller.quantityController.value.text
                                .trim()
                                .isEmpty) {
                        } else {
                          controller.quantity.value--;
                          controller.quantityController.value.text =
                              controller.quantity.value.toString();
                        }
                      },
                      child: Icon(
                        Icons.remove_circle_outline_outlined,
                        size: 20.sp,
                        color: controller.quantity.value <= 1 ||
                                controller.quantityController.value.text
                                    .trim()
                                    .isEmpty
                            ? ColorUtils.greyColor
                            : ColorUtils.blackColor,
                      ),
                    ),
                    SpaceUtils.horizontalSpace(15),
                    InkWell(
                        onTap: () {
                          controller.quantity.value++;
                          controller.quantityController.value.text =
                              controller.quantity.value.toString();
                        },
                        child: Icon(
                          Icons.add_circle_outline_outlined,
                          size: 20.sp,
                          color: ColorUtils.blackColor,
                        ))
                  ],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.w, color: ColorUtils.blackColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.w, color: ColorUtils.blackColor),
                ),
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.w, color: ColorUtils.blackColor),
                )),
          )),
    );
  }
}
