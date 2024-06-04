import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/space_utils.dart';
import 'package:shoesly/utils/text_utils.dart';
import 'package:shoesly/views/order_summary/components/TotalAndPaymentBtn.dart';
import 'package:shoesly/widgets/custom_top_bar.dart';

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

class OrderPaymentDetail extends StatelessWidget {
  const OrderPaymentDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text('Payment Detail',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
          infoTile('Sub Total', '\$235,000'),
          SpaceUtils.verticalSpace(15),
          infoTile('Shipping',  '\$235,000'),
          SpaceUtils.verticalSpace(8),
          Divider(color: ColorUtils.productBackground,),
          SpaceUtils.verticalSpace(8),
          infoTile('Total Order', '\$235,00')
        ],
      ),
    );
  }
  Widget infoTile(String title,  String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 200.w,
            child: TextUtils.text(title, color: ColorUtils.lightGreyColor)),
        Container(
            alignment: Alignment.centerRight,
            width: 100.w,
            child: TextUtils.text(price, fontWeight: FontWeight.bold)),

      ],
    );
  }
}

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text('Order Detail',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
          infoTile('Jordan 1 Retro High Tie Dye', 'Nike . Red Grey . 40 . Qty 1', '\$235,000'),
          SpaceUtils.verticalSpace(15),
          infoTile('Jordan 1 Retro High Tie Dye', 'Nike . Red Grey . 40 . Qty 1', '\$235,000'),
        ],
      ),
    );
  }
  Column infoTile(String title, String subtitle, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text(title, fontWeight: FontWeight.bold),
        SpaceUtils.verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200.w,
                child: TextUtils.text(subtitle, color: ColorUtils.lightGreyColor)),
            Container(
              alignment: Alignment.centerRight,
              width: 100.w,
                child: TextUtils.text(price, fontWeight: FontWeight.bold)),

          ],
        ),
      ],
    );
  }
}

class OrderInformation extends StatelessWidget {
  const OrderInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.text('Information',
              fontSize: 18, fontWeight: FontWeight.bold),
          SpaceUtils.verticalSpace(15),
          infoTile('Payment Method', 'Credit Card'),
          SpaceUtils.verticalSpace(8),
          Divider(
            color: ColorUtils.productBackground,
          ),
          SpaceUtils.verticalSpace(8),
          infoTile('Location', 'Lahore, Pakistan'),
        ],
      ),
    );
  }

  Column infoTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils.text(title, fontWeight: FontWeight.bold),
        SpaceUtils.verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils.text(subtitle, color: ColorUtils.lightGreyColor),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 16.sp, color: ColorUtils.lightGreyColor)
          ],
        ),
      ],
    );
  }
}
