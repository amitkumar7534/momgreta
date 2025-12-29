import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/coreComponents/EditText.dart';
import 'package:momgreta/components/coreComponents/TextView.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/screens/authentication/login_controller.dart';
import 'package:momgreta/screens/authentication/signup/sign_up.dart';
import 'package:momgreta/screens/welcome_screen/welcome_screen.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import 'package:momgreta/utils/extensions/extensions.dart';

import '../../components/styles/appColors.dart';
import '../../utils/appUtils.dart';
import '../dashboard.dart';
import '../otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = Get.find<LoginController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Column(
            children: [
              // Blue Header Section
              Container(
                width: double.infinity,
                color: AppColors.primaryBlue,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Mom',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Greta',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'PRESCHOOL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Check-In & Check-Out System',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // White Content Section with rounded top corners - Expanded to fill remaining space
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.findHelp,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sign in to check in/out your child',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(height: 32),

                        // Email Field
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.findHelp,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyHint,
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Icon(
                                LucideIcons.user,
                                color: AppColors.buttonColor,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        // Password Field
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.findHelp,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyHint,
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Icon(
                                LucideIcons.lock,
                                color: AppColors.buttonColor,
                                size: 20,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  (!_obscurePassword)
                                      ? LucideIcons.eye_off
                                      : LucideIcons.eye,
                                  color: AppColors.greyHint,
                                  size: 20,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 16),

                        // Remember me and Forgot Password
                      /*  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                    activeColor: AppColors.primaryBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.findHelp,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle forgot password
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        */
                        SizedBox(height: 32),
                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () async {

                            // context.pushAndClearNavigator(DashboardPage(index: 0));

                              if (formKey.currentState!.validate()) {
                                Map<String, dynamic> loginData = {
                                  "email": emailController.text,
                                  "password": passwordController.text
                                };
                                await loginController
                                    .login(context, loginData)
                                    .applyLoader;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}