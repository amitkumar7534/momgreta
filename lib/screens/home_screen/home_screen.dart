
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:momgreta/screens/home_screen/home_controller.dart';
import 'package:momgreta/screens/widgets/pin_entry_dialog.dart';
import 'package:momgreta/utils/appUtils.dart';

import '../../components/styles/appColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeController = Get.find<HomeController>();

  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;
  int notificationCount = 2;

  @override
  void initState() {
    super.initState();

    homeController.dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    homeController.dateTimeToday = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

  //  getData();
  }

  void _showPinDialog(String action) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PinEntryDialog(action: action);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            // Blue Header with Greeting
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Notification Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mom',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Greta',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Notification Icon with Badge
/*
                        GestureDetector(
                          onTap: () {
                            AppUtils.toast("Notifications");
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  LucideIcons.bell,
                                  color: AppColors.white,
                                  size: 24,
                                ),
                              ),
                              if (notificationCount > 0)
                                Positioned(
                                  right: -4,
                                  top: -4,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: AppColors.buttonColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primaryBlue,
                                        width: 2,
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$notificationCount',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
*/
                      ],
                    ),
                 /*   SizedBox(height: 30),
                    // Greeting Message
                    Text(
                      '${AppUtils.getTimeBasedGreeting()},',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      homeController.profileModel.value.name ?? 'User',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),

            // White Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),

                        // Check In Card
                        GestureDetector(
                          onTap: () {
                            _showPinDialog('CHECK_IN');
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF66BB6A),
                                  Color(0xFF4CAF50),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4CAF50).withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 50, horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 90,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.25),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    LucideIcons.check,
                                    size: 45,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'CHECK IN',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Drop Off',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white.withOpacity(0.95),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Check Out Card
                        GestureDetector(
                          onTap: () {
                            _showPinDialog('CHECK_OUT');
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF8A65),
                                  AppColors.buttonColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.buttonColor.withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 50, horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 90,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.25),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    LucideIcons.log_out,
                                    size: 45,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'CHECK OUT',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Pick Up',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white.withOpacity(0.95),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> getData() async {
    String dateTimeNow = DateFormat(
      'yyyy-MM-dd',
    ).format(homeController.dateTime);

    Map<String, String> mapData = {"date": dateTimeNow};

    Map<String, String> mealMap = {
      "start_date": dateTimeNow,
      "end_date": dateTimeNow,
    };

    await homeController.getProfile();
    homeController.getAllergens();
    homeController.getDietary();
    await homeController.getStatusHome(mapData);
    await homeController.getUserMeals(mealMap);
    setState(() {});

    bool granted = await AppUtils.askLocationPermission();
    if (granted) {
      print('Now you can safely get the user location.');
    } else {
      print('User denied or location services off.');
    }
  }
}