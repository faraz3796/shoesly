import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/discover_controller.dart';
import 'package:shoesly/models/brandModel.dart';
import 'package:shoesly/models/product_model.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';
import '../../product_detail/product_detail_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.brand,
  });

  final Product product;
  final BrandModel brand;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final controller = Get.find<DiscoverController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              product: widget.product,
              brand: widget.brand,
            ));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: 150.w,
        height: 230.h,
        child: Column(
          children: [
            Container(
              width: 150.w,
              height: 150.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorUtils.productBackground),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: CachedNetworkImage(
                            imageUrl: widget.brand.img,
                            color: ColorUtils.lightGreyColor,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                          width: 120.w,
                          height: 85.h,
                          child: CachedNetworkImage(
                            imageUrl: widget.product.images[0],
                          )),
                    ),
                  )
                ],
              ),
            ),
            SpaceUtils.verticalSpace(10),
            SizedBox(
              width: 150.w,
              //height: 64.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 150.w,
                      child: TextUtils.text(widget.product.name, fontSize: 12)),
                  SpaceUtils.verticalSpace(5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/star.svg',
                        width: 12.w,
                        height: 12.h,
                      ),
                      SpaceUtils.horizontalSpace(5),
                      TextUtils.text('4.5',
                          fontSize: 11, fontWeight: FontWeight.bold),
                      SpaceUtils.horizontalSpace(5),
                      TextUtils.text('(1045 Reviews)',
                          color: ColorUtils.lightGreyColor, fontSize: 11)
                    ],
                  ),
                  SpaceUtils.verticalSpace(5),
                  SizedBox(
                      width: 150.w,
                      child: TextUtils.text('\$${widget.product.price}',
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
