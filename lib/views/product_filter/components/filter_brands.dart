import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/discover_controller.dart';
import 'package:shoesly/controllers/filter_controller.dart';
import 'package:shoesly/models/brandModel.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/space_utils.dart';
import '../../../utils/text_utils.dart';

class FilterBrands extends StatelessWidget {
   FilterBrands({
    super.key,
  });

  final discoverController = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text('Brands', fontSize: 16, fontWeight: FontWeight.w600),
        SpaceUtils.verticalSpace(20),
        SizedBox(
          width: 315.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children: [
                for(int i=0; i<discoverController.brands.length; i ++)
                  FilterBrandWidget(brand: discoverController.brands[i],)
              ],
            ),
          ),
        ),


      ],
    );
  }
}

class FilterBrandWidget extends StatefulWidget {
   FilterBrandWidget({
    super.key, required this.brand,
  });

   final BrandModel brand;

  @override
  State<FilterBrandWidget> createState() => _FilterBrandWidgetState();
}

class _FilterBrandWidgetState extends State<FilterBrandWidget> {
  final discoverController = Get.find<DiscoverController>();
  final filterController = Get.find<FilterController>();

  RxInt productsNo = 1.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discoverController.products.forEach((product){
      if(product.brandId == widget.brand.id){
        productsNo ++;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 12.0),
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
                    InkWell(
                      onTap: (){
                        if(filterController.selectedBrands.contains(widget.brand)){
                          filterController.selectedBrands.remove(widget.brand);
                        }else {
                          filterController.selectedBrands.add(widget.brand);
                        }
                      },
                      child: Container(
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
                          child:
                              CachedNetworkImage(imageUrl: widget.brand.img, color: ColorUtils.blackColor,),
                        ),
                      ),
                    ),
                    Obx(() => filterController.selectedBrands.contains(widget.brand) ? Positioned(
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
                    ): SizedBox()),
                  ],
                ),
              ),
              TextUtils.text('${widget.brand.title}', fontWeight: FontWeight.bold),
              SpaceUtils.verticalSpace(4),
              Obx(() =>  TextUtils.text('${productsNo.value} Item(s)',
                  fontSize: 11, color: ColorUtils.lightGreyColor))
            ],
          )
        ],
      ),
    );
  }
}
