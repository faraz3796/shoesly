import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';
import 'added_to_cart_sheet.dart';

class ItemQuantitySheet extends StatelessWidget {
  const ItemQuantitySheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      alignment: Alignment.center,
      width: SizeUtils.width.w,
      padding: EdgeInsets.symmetric(horizontal:  30.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: ColorUtils.scaffoldColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r))),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorUtils.lightGreyColor,
              borderRadius: BorderRadius.circular(10.r)
            ),
          ),

          SpaceUtils.verticalSpace(20),
          Container(
            width: SizeUtils.width.w,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils.text('Add to cart', fontSize: 20, fontWeight: FontWeight.bold),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.close, size: 18.sp, color: ColorUtils.blackColor,))
              ],
            ),
          ),
          SpaceUtils.verticalSpace(5),
          Container(
            width: SizeUtils.width.w,
            child: TextFormField(
              cursorColor: ColorUtils.blackColor,
              style: GoogleFonts.urbanist(),
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.remove_circle_outline_outlined),
                    SpaceUtils.horizontalSpace(10),
                    Icon(Icons.add_circle_outline_outlined)
                  ],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.w,
                      color: ColorUtils.blackColor
                  ),

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.w,
                      color: ColorUtils.blackColor
                  ),

                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.w,
                    color: ColorUtils.blackColor
                  ),

                )
              ),
            ),
          ),
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
                  TextUtils.text('\$235.00',
                      fontSize: 20, fontWeight: FontWeight.bold),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                      backgroundColor: Colors.transparent,
                      AddedToCartSheet());
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
        ],
      ),
    );
  }
}