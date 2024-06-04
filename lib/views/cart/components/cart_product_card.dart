import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:  15.0.h),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          dragDismissible: false,
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {},
              backgroundColor: ColorUtils.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r)),
            ),
          ],
        ),
        child: SizedBox(
          width: 315.w,
          child: Row(
            children: [
              Container(
                width: 88.w,
                height: 88.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorUtils.productBackground),
                child: SizedBox(
                  width: 70.w,
                  height: 50.h,
                  child: Image.asset(
                      'assets/images/products/Adidas1.png'),
                ),
              ),
              SpaceUtils.horizontalSpace(15),
              SizedBox(
                width: 212.w,
                height: 88.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils.text(
                      'Jordan 1 Retro High Tie Dye',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpaceUtils.verticalSpace(5),
                    TextUtils.text('Nike . Red Grey . 40',
                        fontSize: 12,
                        color: ColorUtils.lightGreyColor),
                    SpaceUtils.verticalSpace(10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 110.w,
                          child: TextUtils.text('\$235,00',
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 90.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.remove_circle_outline_outlined,
                                size: 24.sp,
                              ),
                              SpaceUtils.horizontalSpace(8),
                              TextUtils.text('1',
                                  fontWeight: FontWeight.bold),
                              SpaceUtils.horizontalSpace(8),
                              Icon(
                                Icons.add_circle_outline_outlined,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}