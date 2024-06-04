import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoesly/controllers/product_details_controller.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';

class ProductColors extends StatelessWidget {
  ProductColors({
    super.key,
    required this.product,
  });

  final Product product;
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Wrap(
          spacing: 8,
          alignment: WrapAlignment.end,
          direction: Axis.horizontal,
          children: [
            for (int i = 0; i < product.colorOptions.length; i++)
              colorOption(i),
          ],
        ),
      ),
    );
  }

  Widget colorOption(int i) {
    return InkWell(
      onTap: () {
        controller.selectedColor.value = product.colorOptions[i];
      },
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 1,
                color: Color(int.parse('0xff${product.colorOptions[i]}'))),
            color: Color(int.parse('0xff${product.colorOptions[i]}'))),
        child:
            Obx(() => controller.selectedColor.value == product.colorOptions[i]
                ? Icon(
                    Icons.check,
                    size: 15.sp,
                    color: Colors.white,
                  )
                : const SizedBox()),
      ),
    );
  }
}
