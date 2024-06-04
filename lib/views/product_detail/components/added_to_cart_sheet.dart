import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/views/cart/cart_screen.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class AddedToCartSheet extends StatelessWidget {
  const AddedToCartSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 313.h,
      alignment: Alignment.center,
      width: SizeUtils.width.w,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: ColorUtils.scaffoldColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r))),
      child: Column(
        children: [
          Container(
            height: 84.h,
            width: 84.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.w, color: ColorUtils.blackColor)
            ),
            child: SvgPicture.asset('assets/svgs/check.svg', height: 25.h, width: 35.w, color: ColorUtils.lightGreyColor,),
          ),
          SpaceUtils.verticalSpace(20),
          Container(
            width: SizeUtils.width.w,
            alignment: Alignment.center,
            child: TextUtils.text('Added to cart', fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SpaceUtils.verticalSpace(5),
          Container(
            width: SizeUtils.width.w,
            alignment: Alignment.center,
            child: TextUtils.text('1 Item Total', fontSize: 14, color: ColorUtils.lightGreyColor),
          ),
          SpaceUtils.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height: 50.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(width: 1.w, color: ColorUtils.lightGreyColor)
                  ),
                  child: TextUtils.text('BACK EXPLORE',
                    fontWeight: FontWeight.bold,),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => CartScreen());
                },
                child: Container(
                  height: 50.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: ColorUtils.blackColor),
                  child: TextUtils.text('TO CART',
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}