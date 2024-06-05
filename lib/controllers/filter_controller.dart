import 'package:get/get.dart';
import 'package:shoesly/models/brandModel.dart';

class FilterController extends GetxController{
  RxList<BrandModel> selectedBrands = <BrandModel>[].obs;
}