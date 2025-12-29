import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../components/styles/appColors.dart';
import '../../main.dart';


class LoaderUtils{
  static BuildContext? get _context => navState.currentContext;

  static GlobalLoaderOverlay loaderInit({required Widget child}){
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (_){
        return  Center(
          child: SpinKitCircle(
            color: AppColors.red, // Green Loader
            size: 70.0,
          ),


          // SpinKitCircle(
          //   color: AppColors.btnColor, // Green Loader
          //   size: 70.0,
          // )
        );
      },
      child: child,
    );
  }

  static openPopup(Widget child){
    _context?.loaderOverlay.show(
      widgetBuilder: (_){
        return child;
      },

    );
  }

  static show(){
    try{
      _context?.loaderOverlay.show();
      print('start');
    }catch(e){
      print('isssueeee ::: $e');
    }

  }

  static dismiss({String? msg}) async{
    _context?.loaderOverlay.hide();
    // if(msg!= null) AppUtils.toast(msg);
  }

  static showError(String error){
    _context?.loaderOverlay.hide();
    // AppUtils.toastEr(Exception(error));
    // AppUtils.toastFailure(error);
  }
}
