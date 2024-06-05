import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/filter_controller.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../utils/size_utils.dart';
import 'components/filteer_gender.dart';
import 'components/filter_brands.dart';
import 'components/filter_color.dart';
import 'components/filter_price.dart';
import 'components/filter_sort.dart';

class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  final controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomTopBar(
        title:
            TextUtils.text('Filter', fontSize: 16, fontWeight: FontWeight.w600),
        action: SizedBox(),
      ),
      bottomNavigationBar: Container(
        width: SizeUtils.width.w,
        height: 80.h,
        alignment: Alignment.center,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.h,
              width: 150.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border:
                      Border.all(width: 1, color: ColorUtils.lightGreyColor)),
              child: TextUtils.text('RESET(4)',
                  fontWeight: FontWeight.bold, color: ColorUtils.blackColor),
            ),
            Container(
              height: 50.h,
              width: 150.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: ColorUtils.blackColor),
              child: TextUtils.text('APPLY',
                  fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceUtils.verticalSpace(20),
            FilterBrands(),
            SpaceUtils.verticalSpace(20),
            FilterPrice(),
            SpaceUtils.verticalSpace(20),
            FilterSort(),
            SpaceUtils.verticalSpace(20),
            FilterGender(),
            SpaceUtils.verticalSpace(20),
            FilterColor(),
            SpaceUtils.verticalSpace(20),
          ],
        ),
      ),
    ));
  }
}



