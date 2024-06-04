import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shoesly/controllers/product_details_controller.dart';
import 'package:shoesly/models/brandModel.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/cart/cart_screen.dart';
import 'package:shoesly/views/product_detail/components/item_quantity_sheet.dart';
import 'package:shoesly/views/product_detail/components/price_cart_btn.dart';
import 'package:shoesly/views/product_detail/components/product_cover_images.dart';
import 'package:shoesly/views/product_detail/components/product_description.dart';
import 'package:shoesly/views/product_detail/components/product_name_rating.dart';
import 'package:shoesly/views/product_detail/components/product_size.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color_utils.dart';
import '../rating_reviews/rating_reviews_screen.dart';
import 'components/added_to_cart_sheet.dart';
import 'components/product_reviews.dart';

class ProductDetailScreen extends StatefulWidget {
   ProductDetailScreen(
      {super.key, required this.product, required this.brand});

  final Product product;
  final BrandModel brand;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final controller = Get.put(ProductDetailsController());


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
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
                ProductCoverImages(
                  product: widget.product,
                  brand: widget.brand,
                ),
                SpaceUtils.verticalSpace(20),
                ProductNameRating(
                  product: widget.product,
                ),
                SpaceUtils.verticalSpace(20),
                ProductSize(
                  product: widget.product,
                ),
                SpaceUtils.verticalSpace(20),
                ProductDescription(
                  product: widget.product,
                ),
                SpaceUtils.verticalSpace(20),
                ProductReviews(),
                SpaceUtils.verticalSpace(20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ProductPriceAndCartBtn(
          product: widget.product,
        ),
      ),
    );
  }
}
