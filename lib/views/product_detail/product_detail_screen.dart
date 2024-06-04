import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/cart/cart_screen.dart';
import 'package:shoesly/views/product_detail/components/item_quantity_sheet.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color_utils.dart';
import '../rating_reviews/rating_reviews_screen.dart';
import 'components/added_to_cart_sheet.dart';
import 'components/product_reviews.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopBar(
          action: IconButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              icon: SvgPicture.asset(
                'assets/svgs/cart.svg',
                width: 24.w,
                height: 24.h,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpaceUtils.verticalSpace(20),
                ProductDisplayImage(),
                SpaceUtils.verticalSpace(20),
                ProductNameRating(),
                SpaceUtils.verticalSpace(20),
                ProductSize(),
                SpaceUtils.verticalSpace(20),
                ProductDescription(),
                SpaceUtils.verticalSpace(20),
                ProductReviews(),
                SpaceUtils.verticalSpace(20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ProductPriceAndCartBtn(),
      ),
    );
  }
}

class ProductPriceAndCartBtn extends StatelessWidget {
  const ProductPriceAndCartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.width.w,
      height: 90.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils.text('Price',
                  fontSize: 12, color: ColorUtils.lightGreyColor),
              SpaceUtils.verticalSpace(4),
              TextUtils.text('\$235.00',
                  fontSize: 20, fontWeight: FontWeight.bold),
            ],
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(
                backgroundColor: Colors.transparent,
                  ItemQuantitySheet());
            },
            child: Container(
              height: 50.h,
              width: 156.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: ColorUtils.blackColor),
              child: TextUtils.text('ADD TO CART',
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}



class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 315.w,
          child: TextUtils.text('Description',
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: TextUtils.text(
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair.",
              fontSize: 14,
              color: ColorUtils.greyColor),
        ),
      ],
    );
  }
}

class ProductSize extends StatelessWidget {
  const ProductSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 315.w,
            child: TextUtils.text('Size',
                fontSize: 16, fontWeight: FontWeight.w600)),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 1.w, color: ColorUtils.lightGreyColor),
                ),
                child: TextUtils.text('39', color: ColorUtils.greyColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProductNameRating extends StatelessWidget {
  const ProductNameRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 315.w,
          child: TextUtils.text('Jordan 1 Retro High Tie Dye',
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SpaceUtils.verticalSpace(8),
        SizedBox(
          width: 315.w,
          child: Row(
            children: [
              SizedBox(
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 5; i++)
                      SvgPicture.asset(
                        'assets/svgs/star.svg',
                        width: 12.w,
                        height: 12.h,
                      )
                  ],
                ),
              ),
              SpaceUtils.horizontalSpace(4),
              TextUtils.text('4.5', fontSize: 11, fontWeight: FontWeight.bold),
              SpaceUtils.horizontalSpace(4),
              TextUtils.text('(1045 Reviews)',
                  fontSize: 11, color: ColorUtils.lightGreyColor),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDisplayImage extends StatelessWidget {
  ProductDisplayImage({
    super.key,
  });

  CarouselController _carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList images = [
    'assets/images/products/Adidas1.png',
    'assets/images/products/Adidas1.png',
    'assets/images/products/Adidas1.png'
  ].obs;

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
                  itemCount: images.length,
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
                      child: Image.asset(
                        images[index],
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
                        count: images.length,
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
                    Container(
                      width: 132.w,
                      height: 40.h,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: ColorUtils.lightGreyColor),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //border: Border.all(width: 1, color: ColorUtils.lightGreyColor),
                              color: ColorUtils.blackColor,
                            ),
                          ),
                        ],
                      ),
                    )
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
