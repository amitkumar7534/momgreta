
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:momgreta/screens/dashboard.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';

import '../../../../../../utils/SharedPrefHelper/shared_pref_helper.dart';
import '../../services/api_service.dart';
import '../../services/urls.dart';
import '../../utils/appUtils.dart';
import '../otp_screen.dart';
import 'login_model/login_model.dart';

class LoginController extends GetxController{



  // login method
  Future<void> login(BuildContext context, Map<String, dynamic> loginData) async {

    try{
      var response = await ApiService.post(Urls.login,Urls.baseUrl,body: loginData);

      LoginModel loginModel = LoginModel.fromJson(response);
      if(loginModel.statusCode != 200){
        AppUtils.toastError(loginModel.message);
      }else{
        SharedPrefHelper.profile = loginModel;

        print("object>>>>>>>>>>${SharedPrefHelper.profile?.data?.accessToken}");
        context.pushAndClearNavigator(DashboardPage(index: 0));

      }



    }catch(e){
      // Toast already shown in _processResponse
      print("❌ API error caught: $e");
    }

  }

  // login method
  Future<void> socialLogin(BuildContext context, Map<String, dynamic> loginData) async {

    try{
      var response = await ApiService.post(Urls.socialLogin,Urls.baseUrl,body: loginData);

      LoginModel loginModel = LoginModel.fromJson(response);
      SharedPrefHelper.profile = loginModel;

      final GoogleSignIn _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
        context.pushAndClearNavigator(DashboardPage(index: 0));

    }catch(e){
      print("❌ API error caught: $e");
    }

  }

  // signup method
  Future<void> register(BuildContext context, Map<String, dynamic> registerData) async {

    try {
      var response = await ApiService.post(Urls.register,Urls.baseUrl,body: registerData);

      // LoginModel loginModel = LoginModel.fromJson(response);
      // SharedPrefHelper.profile = loginModel;
      // context.pushNavigator(DashboardPage(index: 0));
      context.pushNavigator(OtpScreen(email:registerData['email']));

    } catch (e) {
      // Toast already shown in _processResponse
      print("❌ API error caught: $e");
    }

  }

  // signup method
  Future<void> verifyOtp(BuildContext context, Map<String, dynamic> registerData) async {

    try {
      var response = await ApiService.post(Urls.verifyOtp,Urls.baseUrl,body: registerData);

      LoginModel loginModel = LoginModel.fromJson(response);
      SharedPrefHelper.profile = loginModel;

        context.pushNavigator(DashboardPage(index: 0));

    } catch (e) {
      // Toast already shown in _processResponse
      print("❌ API error caught: $e");
    }

  }


}