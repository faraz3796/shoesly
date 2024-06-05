import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/order_summary/components/TotalAndPaymentBtn.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';

import 'components/order_details.dart';
import 'components/order_information.dart';
import 'components/order_payment_details.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopBar(
          title: TextUtils.text('Order Summary',
              fontSize: 16, fontWeight: FontWeight.w600),
          action: SizedBox(),
        ),
bottomNavigationBar: TotalAndPaymentBtn(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderInformation(),
                SpaceUtils.verticalSpace(20),
                OrderDetail(),
                SpaceUtils.verticalSpace(20),
                OrderPaymentDetail()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

