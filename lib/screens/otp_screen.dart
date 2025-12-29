import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import 'package:momgreta/utils/extensions/extensions.dart';
import '../components/coreComponents/EditText.dart';
import 'authentication/login_controller.dart';


class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  bool isResendAvailable = true;
  int remainingSeconds = 0;
  Timer? timer;

    var loginController = Get.find<LoginController>();

  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void startTimer() {
    setState(() {
      isResendAvailable = false;
      remainingSeconds = 180; // 3 minutes = 180 seconds
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        setState(() {
          isResendAvailable = true;
        });
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();

  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
          
                  /// Happinest logo text
                  Image.asset("assets/images/app_logo.png",height: 100,width: 100,),
          
                  const SizedBox(height: 40),
          
                  const Text(
                    "Verifiy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          
                  const SizedBox(height: 12),
                  Text(
                    "We sent One Time verification code\non your email ${widget.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
          
                  const SizedBox(height: 32),
          
                  /// TextField
                  EditText(
                    hint: 'Enter 6-digit code',
                    controller: otpController,
                    labelStyle: 14.txtMediumWhite,
                    hintStyle: 14.txtMediumgrey,
                    inputType: TextInputType.number,
                    filledColor: Colors.grey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textStyle: 14.txtMediumWhite,
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Otp cannot be empty';
                      }
                      return null;
                    },
                  ),
          
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        "Session Expired. ",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: isResendAvailable
                            ? () {
                          startTimer();
                          // Add resend logic here (e.g., send new OTP)
                        }
                            : null,
                        child: Text(
                          isResendAvailable
                              ? "Resend"
                              : "Resend (${formatTime(remainingSeconds)})",
                          style: TextStyle(
                            color: isResendAvailable
                                ? AppColors.red
                                : Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
          
          
                  SizedBox(height: 40,),
                  /// Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
          
                        if(formKey.currentState!.validate()){
          
                          Map<String, dynamic> loginData = {
                            "email": widget.email,
                            "otp": otpController.text
                          };
          
                          await loginController.verifyOtp(context, loginData).applyLoader;
          
                        }
          
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),//
                      child: Text(
                        'Verify',
                        style: 14.txtMediumWhite,
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
