import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoesly/controllers/analytics_controller.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/color_utils.dart';

import '../models/brandModel.dart';

class DiscoverController extends GetxController {
  RxString selectedBrandId = 'All'.obs;
  RxList<BrandModel> brands = <BrandModel>[].obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Product> filteredProducts = <Product>[].obs;
  final brandDb = FirebaseFirestore.instance.collection('brands');
  final productDb = FirebaseFirestore.instance.collection('products');
  AnalyticsController analyticsController = Get.find();

  getBrands() async {
    try {
      brands.clear();
      await brandDb.get().then((snapshot) {
        snapshot.docs.forEach((doc) {
          brands.add(BrandModel.fromJson(doc.data()));
        });
      });
    } catch (e) {
      Get.snackbar('Error', 'Error Getting Brands',
          backgroundColor: ColorUtils.redColor);
    }
  }

  getProducts() async {
    try {
      products.clear();
      await productDb.get().then((snapshot) {
        snapshot.docs.forEach((doc) {
          products.add(Product.fromJson(doc.data()));
        });
      });
    } catch (e) {
      Get.snackbar('Error', 'Error Getting Products',
          backgroundColor: ColorUtils.redColor);
    }
  }

  filterProducts() {
    filteredProducts.clear();
    products.forEach((element){
      if(element.brandId == selectedBrandId.value) {
        filteredProducts.add(element);
      }
    });
    print(filteredProducts.length);
  }
}
