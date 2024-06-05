
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

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