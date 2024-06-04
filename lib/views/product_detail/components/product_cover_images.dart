import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesly/models/brandModel.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/views/product_detail/components/product_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductCoverImages extends StatelessWidget {
  ProductCoverImages({
    super.key,
    required this.product,
    required this.brand,
  });

  final Product product;
  final BrandModel brand;

  CarouselController _carouselController = CarouselController();
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 315.w,
        height: 315.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: ColorUtils.productBackground,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 252.w,
                height: 180.h,
                child: CarouselSlider.builder(
                  itemCount: product.images.length,
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return Center(
                        child: Hero(
                      tag: 'displayImage',
                      child: CachedNetworkImage(
                        imageUrl: product.images[index],
                      ),
                    ));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20.0.w, bottom: 20.0.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => AnimatedSmoothIndicator(
                        activeIndex: currentIndex.value,
                        count: product.images.length,
                        effect: ScrollingDotsEffect(
                          dotHeight: 7.h,
                          dotWidth: 7.w,
                          activeDotColor: ColorUtils.blackColor,
                          dotColor: Colors.grey,
                        ),
                        onDotClicked: (index) {
                          _carouselController.animateToPage(index);
                        },
                      ),
                    ),
                    ProductColors(product: product,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


