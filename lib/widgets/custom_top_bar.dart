import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/text_utils.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomTopBar({super.key, this.backButton = true, this.action, this.title});

  final bool backButton;
  final Widget? action;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: SizedBox(
        height: 55.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(backButton)...[
            IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset('assets/svgs/arrow-left.svg'))
              ],
            if(title != null)...[
              title!
            ],
            if(action != null)...[
              action!
            ]
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
