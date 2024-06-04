import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  RxString deviceId = ''.obs;

  getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      deviceId.value = info.id;
    } else {
      final info = await deviceInfo.iosInfo;
      deviceId.value = info.identifierForVendor ?? '1234';
    }
    print(deviceId);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDeviceId();
  }
}
