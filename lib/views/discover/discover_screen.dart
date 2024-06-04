import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/models/brandModel.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/cart/cart_screen.dart';
import 'package:shoesly/views/product_detail/product_detail_screen.dart';
import 'package:shoesly/views/product_filter/product_filter_screen.dart';

import '../../controllers/discover_controller.dart';
import '../../widgets/custom_top_bar.dart';
import 'components/brands_widget.dart';
import 'components/product_card.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final controller = Get.put(DiscoverController());
  RxBool load = true.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getBrands().then((v) {
      controller.getProducts();
      load.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomTopBar(
            backButton: false,
            title: TextUtils.text('Discover',
                fontSize: 30, fontWeight: FontWeight.w700),
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
          floatingActionButton: InkWell(
            onTap: () {
              Get.to(() => ProductFilterScreen());
            },
            child: Container(
              width: 120.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: ColorUtils.blackColor),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/filter.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  SpaceUtils.horizontalSpace(8),
                  TextUtils.text('FILTER',
                      fontWeight: FontWeight.bold, color: Colors.white)
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Obx(() => load.value || controller.brands.isEmpty
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceUtils.verticalSpace(20),
                    DiscoverBrands(),
                    SpaceUtils.verticalSpace(10),
                    Expanded(
                      child: Obx(() => controller.products.isEmpty
                          ? const Center(
                              child: CupertinoActivityIndicator(),
                            )
                          : controller.selectedBrandId.value != 'All' &&
                                  controller.filteredProducts.isEmpty
                              ? Center(
                                  child: TextUtils.text('No Product Found'),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 4.0,
                                          mainAxisSpacing: 4.0,
                                          childAspectRatio: 0.7),
                                  itemCount: null,
                                  itemBuilder: (context, index) {
                                    BrandModel? brand;

                                    return Obx(() {
                                      if (controller.selectedBrandId.value ==
                                          'All') {
                                        controller.brands.forEach((element) {
                                          if (element.id ==
                                              controller
                                                  .products[index %
                                                      controller
                                                          .products.length]
                                                  .brandId) {
                                            brand = element;
                                          }
                                        });
                                        print(brand);
                                        return ProductCard(
                                          product: controller.products[index %
                                              controller.products.length],
                                          brand: brand!,
                                        );
                                      } else {
                                        controller.brands.forEach((element) {
                                          if (element.id ==
                                              controller
                                                  .filteredProducts[index %
                                                      controller
                                                          .filteredProducts
                                                          .length]
                                                  .brandId) {
                                            brand = element;
                                          }
                                        });
                                        return ProductCard(
                                          product: controller.filteredProducts[
                                              index %
                                                  controller
                                                      .filteredProducts.length],
                                          brand: brand!,
                                        );
                                      }
                                    });
                                  })),
                    )
                  ],
                ))),
    );
  }
}
