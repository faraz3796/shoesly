import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/device_controller.dart';
import 'package:shoesly/models/cart_model.dart';
import 'package:shoesly/utils/color_utils.dart';

class CartController extends GetxController {
  final db = FirebaseFirestore.instance.collection('cart');
  final deviceController = Get.find<DeviceController>();
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxDouble totalPrice = 0.0.obs;

  Future<int> addtoCart(Map<String, dynamic> products) async {
    try {
      final doc =
          await db.doc(deviceController.deviceId.value.toString()).get();

      if (doc.exists) {
        await db.doc(deviceController.deviceId.value.toString()).update({
          'products': FieldValue.arrayUnion([products])
        });
      } else {
        await db.doc(deviceController.deviceId.value.toString()).set({
          'products': [products]
        });
      }

      return 200;
      //Get.snackbar('Success', 'Added to cart');
    } catch (e) {
      Get.snackbar('Error', 'Error adding in cart',
          backgroundColor: ColorUtils.redColor);
      return 404;
    }
  }

  getCart() async {
    try {
      cartItems.clear();
      final doc =
          await db.doc(deviceController.deviceId.value.toString()).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null) {
          List items = data['products'];
          items.forEach((item) {
            cartItems.add(CartModel.fromJson(item));

          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Error getting cart',
          backgroundColor: ColorUtils.redColor);
    }
  }

  removeCartItem(CartModel item) async {
    // cartItems.remove(item);
    await db.doc(deviceController.deviceId.value).update({
      'products' : FieldValue.arrayRemove([item.toJson()])
    });
  }
}
