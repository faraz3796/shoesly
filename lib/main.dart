import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/controllers/analytics_controller.dart';
import 'package:shoesly/utils/color_utils.dart';
import 'package:shoesly/utils/size_utils.dart';
import 'package:shoesly/views/discover/discover_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC88kpLrJSEwDMld1PuS5KiXEweS0qch_Q",
          appId: '1:640351330889:android:8107e216c088e5cba7d598',
          messagingSenderId: '640351330889 ',
          projectId: 'shoesly-cb442'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AnalyticsController analyticsController = Get.put(AnalyticsController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(SizeUtils.width, SizeUtils.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: <NavigatorObserver>[analyticsController.observer!],
          theme: ThemeData(
            scaffoldBackgroundColor: ColorUtils.scaffoldColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: ColorUtils.scaffoldColor,
                elevation: 0.0,
                scrolledUnderElevation: 0.0,
                surfaceTintColor: ColorUtils.scaffoldColor),
            textTheme: GoogleFonts.urbanistTextTheme(),
          ),
          home: child,
        );
      },
      child: DiscoverScreen(),
    );
  }
}
