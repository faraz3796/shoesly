import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/discover_controller.dart';

import '../../../models/brandModel.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/text_utils.dart';

class DiscoverBrands extends StatelessWidget {
  DiscoverBrands({
    super.key,
  });

  final controller = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.width.w,
      child: Padding(
        padding: EdgeInsets.only(left: 25.0.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() => Row(
                children: [
                  brandNameAll(),
                  for (int i = 0; i < controller.brands.length; i++)
                    brandName(controller.brands[i]),
                ],
              )),
        ),
      ),
    );
  }

  Widget brandName(BrandModel brand) {
    return Obx(() => Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: InkWell(
        onTap: () {
          controller.selectedBrandId.value = brand.id;
          controller.filterProducts();
        },
        child: TextUtils.text(brand.title,
            fontSize: 20,
            color: controller.selectedBrandId.value == brand.id
                ? ColorUtils.blackColor
                : ColorUtils.lightGreyColor,
            fontWeight: FontWeight.bold),
      ),
    ));
  }

  Widget brandNameAll() {
    return Obx(() => Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: InkWell(
        onTap: () {
          controller.selectedBrandId.value = 'All';
          controller.filterProducts();
        },
        child: TextUtils.text('All',
            fontSize: 20,
            color: controller.selectedBrandId.value == 'All'
                ? ColorUtils.blackColor
                : ColorUtils.lightGreyColor,
            fontWeight: FontWeight.bold),
      ),
    ));
  }
}
