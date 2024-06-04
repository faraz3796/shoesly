import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController{
   FirebaseAnalytics analytics = FirebaseAnalytics.instance;
   FirebaseAnalyticsObserver? observer;

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    observer = FirebaseAnalyticsObserver(analytics: analytics);
  }
}