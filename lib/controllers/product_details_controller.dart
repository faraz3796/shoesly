import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/cart_controller.dart';
import 'package:shoesly/models/cart_model.dart';
import 'package:shoesly/models/product_model.dart';

class ProductDetailsController extends GetxController {
  RxString selectedSize = ''.obs;
  RxString selectedColor = ''.obs;
  RxInt quantity = 1.obs;
  Rx<TextEditingController> quantityController = TextEditingController().obs;
  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedSize.value = '';
    selectedColor.value = '';
    quantity.value = 1;
    quantityController.value.text = quantity.value.toString();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    quantityController.value.dispose();
  }

  sendToCart(Product product) async {

    CartModel cartItem = CartModel(
        productId: product.id,
        color: selectedColor.value,
        quantity: quantity.value,
        size: selectedSize.value);
    int res = await cartController.addtoCart(cartItem.toJson());
    return res;
  }
}
