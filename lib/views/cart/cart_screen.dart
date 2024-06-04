import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/cart/components/total_checkout_btn.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';

import 'components/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopBar(
          title:
              TextUtils.text('Cart', fontSize: 16, fontWeight: FontWeight.w600),
          action: SizedBox(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CartProductCard()
              ],
            ),
          ),
        ),
        bottomNavigationBar: TotalAndCheckoutBn(),
      ),
    );
  }
}


