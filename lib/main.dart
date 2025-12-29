import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momgreta/screens/authentication/login_controller.dart';
import 'package:momgreta/screens/authentication/login_screen.dart';
import 'package:momgreta/screens/dashboard.dart';
import 'package:momgreta/screens/home_screen/home_controller.dart';
import 'package:momgreta/utils/SharedPrefHelper/shared_pref_helper.dart';
import 'package:momgreta/utils/extensions/loader_utils.dart';


final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
late List<CameraDescription> cameras;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // Initialize controller once, globally
  Get.put(LoginController(), permanent: true);
  Get.put(HomeController(), permanent: true);

  runApp(SlyceUpApp());
}


class SlyceUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoaderUtils.loaderInit(
      child: GetMaterialApp(
        title: 'SlyceUp',
        navigatorKey: navState,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF1C1C1E), // Dark background
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFF2C2C2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        home: (SharedPrefHelper.profile != null)?DashboardPage(index: 0):LoginPage(),
       // home: DashboardPage(index: 0),
      ),
    );
  }
}

