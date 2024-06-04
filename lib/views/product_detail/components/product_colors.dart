import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          children: [
            for (int i = 0; i < product.colorOptions.length; i++)
              colorOption(i),
          ],
        ),
      ),
    );
  }

  Container colorOption(int i) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 1,
              color: Color(int.parse('0xff${product.colorOptions[i]}'))),
          color: Color(int.parse('0xff${product.colorOptions[i]}'))),
    );
  }
}
