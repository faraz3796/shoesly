
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text('Information',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
          infoTile('Payment Method', 'Credit Card'),
          SpaceUtils.verticalSpace(8),
          Divider(
            color: ColorUtils.productBackground,
          ),
          SpaceUtils.verticalSpace(8),
          infoTile('Location', 'Lahore, Pakistan'),
        ],
      ),
    );
  }

  Column infoTile(String title, String subtitle) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text(title, fontWeight: FontWeight.bold),
        SpaceUtils.verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils.text(subtitle, color: ColorUtils.lightGreyColor),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 16.sp, color: ColorUtils.lightGreyColor)
          ],
        ),
      ],
    );
  }
}
