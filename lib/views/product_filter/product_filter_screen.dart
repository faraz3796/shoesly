import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../utils/size_utils.dart';

class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
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

class FilterPrice extends StatelessWidget {
  FilterPrice({
    super.key,
  });

  SfRangeValues _values = const SfRangeValues(200.0, 750.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Price', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SfRangeSlider(
          min: 10,
          max: 1000,
          showLabels: true,
          startThumbIcon: sliderThumbShape(),
          endThumbIcon: sliderThumbShape(),
          values: _values,
          showTicks: true,

          enableTooltip: true,
          stepSize: 10,
          activeColor: ColorUtils.blackColor,
          inactiveColor: ColorUtils.lightGreyColor,
          onChanged: (SfRangeValues value) {
            // setState(() {
            //   if (value.start > 0 && value.end > 49) {
            //     _values = value;
            //   }
            // });
          },
        ),
      ],
    );
  }

  Container sliderThumbShape() {
    return Container(
          width: 50.w,
          height: 54.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.blackColor
          ),
          child: Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
          ),
        );
  }
}



class FilterColor extends StatelessWidget {
  const FilterColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Color', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(width: 1, color: ColorUtils.blackColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: ColorUtils.blackColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1, color: ColorUtils.lightGreyColor)),
                    ),
                    SpaceUtils.horizontalSpace(8),
                    TextUtils.text('Black',
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class FilterGender extends StatelessWidget {
  const FilterGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Gender', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border:
                        Border.all(width: 1, color: ColorUtils.lightGreyColor)),
                child: TextUtils.text('Male',
                    fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}

class FilterSort extends StatelessWidget {
  const FilterSort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Sort By', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border:
                        Border.all(width: 1, color: ColorUtils.lightGreyColor)),
                child: TextUtils.text('Most recent',
                    fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}

class FilterBrands extends StatelessWidget {
  const FilterBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Brands', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SizedBox(
          height: 110.h,
          width: Get.width.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 60.w,
                      height: 60.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.greyColor100,
                            ),
                            child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Image.asset(
                                  'assets/icons/brands/Nike-Black.png'),
                            ),
                          ),
                          Positioned(
                            left: 35.w,
                            top: 30.h,
                            child: Container(
                              width: 20.w,
                              height: 20.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.blackColor),
                              child: SvgPicture.asset('assets/svgs/check.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextUtils.text('Nike', fontWeight: FontWeight.bold),
                    SpaceUtils.verticalSpace(4),
                    TextUtils.text('1001 Items',
                        fontSize: 11, color: ColorUtils.lightGreyColor)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
