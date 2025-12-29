import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/coreComponents/EditText.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/screens/welcome_screen/welcome_screen.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import 'package:momgreta/utils/extensions/extensions.dart';
import '../../../components/styles/appColors.dart';
import '../../dashboard.dart';
import '../login_controller.dart';


class SignUp extends StatelessWidget {
   SignUp({super.key});


   var loginController = Get.find<LoginController>();

   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   RxBool _obscurePassword = true.obs;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SlyceUp',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Snap your meal. Slyce it up.',
                    style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Join the community of food explorers',
                    style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  ),
                  SizedBox(height: 24),
                  Image.asset("assets/images/app_logo.png",height: 80,width: 80,),
                  EditText(
                    hint: 'Enter your full name',
                    label: 'Full Name',
                    controller: nameController,
                    labelStyle: 14.txtMediumWhite,
                    hintStyle: 14.txtMediumgrey,
                    prefixIcon: Icon(LucideIcons.user, color: Colors.grey),
                    inputType: TextInputType.text,
                    filledColor: Colors.grey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textStyle: 14.txtMediumWhite,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  EditText(
                    hint: 'Enter your email',
                    label: 'Email',
                    controller: emailController,
                    labelStyle: 14.txtMediumWhite,
                    hintStyle: 14.txtMediumgrey,
                    prefixIcon: Icon(LucideIcons.mail, color: Colors.grey),
                    inputType: TextInputType.emailAddress,
                    filledColor: Colors.grey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textStyle: 14.txtMediumWhite,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  Obx((){
                    return EditText(
                      hint: 'Enter your password',
                      label: 'Password',
                      labelStyle: 14.txtMediumWhite,
                      hintStyle: 14.txtMediumgrey,
                      controller: passwordController,
                      prefixIcon: Icon(LucideIcons.lock, color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: (){
                            _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(
                          (!_obscurePassword.value)?LucideIcons.eye_closed:LucideIcons.eye,
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: _obscurePassword.value,
                      inputType: TextInputType.emailAddress,
                      filledColor: Colors.grey.withOpacity(0.2),
                      borderColor: Colors.transparent,
                      textStyle: 14.txtMediumWhite,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    );
                  }),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {

                        if(formKey.currentState!.validate()){
                          Map<String, dynamic> registerData = {
                            "email": emailController.text,
                            "password": passwordController.text,
                            "name": nameController.text
                          };
                          await loginController.register(context, registerData).applyLoader;
                        }
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: 14.txtMediumWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),

                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                    context.pop();
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.greenAccent),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
