import 'package:flutter/material.dart';
import 'package:momgreta/utils/extensions/extensions.dart';


import 'appColors.dart';

extension TextStyles on num{

  TextStyle get txtRegularBlackText => _textStyle(this, AppColors.black, Family.regular);

  TextStyle get txtRegularError => _textStyle(this, AppColors.red, Family.regular);

  TextStyle get txtRegularWhite => _textStyle(this,AppColors.white,Family.regular);
  TextStyle get txtRegularBlack => _textStyle(this,AppColors.black,Family.regular);
  TextStyle get txtRegularbtncolor => _textStyle(this,AppColors.btnColor,Family.regular);
  TextStyle get txtRegularPrimary => _textStyle(this,AppColors.primaryColor,Family.regular);
  TextStyle get txtRegularForget => _textStyle(this,AppColors.forgetText,Family.regular);
  TextStyle get txtRegulargender => _textStyle(this,Color(0xff777676),Family.regular);

  TextStyle get txtMediumWhite => _textStyle(this,AppColors.white,Family.medium);
  TextStyle get txtMediumBlack => _textStyle(this,AppColors.black,Family.medium);
  TextStyle get txtMediumbtncolor => _textStyle(this,AppColors.btnColor,Family.medium);
  TextStyle get txtMediumPrimary => _textStyle(this,AppColors.primaryColor,Family.medium);
  TextStyle get txtMediumbtnred => _textStyle(this,AppColors.red,Family.semiBold);
  TextStyle get txtMediumgrey => _textStyle(this,AppColors.grey,Family.medium);
  TextStyle get txtMediumgender => _textStyle(this,Color(0xff515151),Family.medium);
  TextStyle get txtMediumWhitesplash => _textStyle(this,AppColors.white,Family.splash);
  // TextStyle get txtMediumPBlue => _textStyle(this,AppColors.primaryBlue,Family.medium);
   TextStyle get txtMediumBlackText => _textStyle(this,AppColors.blackText,Family.bold);
  TextStyle get txtsearch => _textStyle(this,AppColors.Grey,Family.medium);
  TextStyle get txtMedgreen => _textStyle(this,AppColors.btnColor,Family.semiBold);


  TextStyle get txtSBoldBlack => _textStyle(this,AppColors.black,Family.semiBold);
  TextStyle get txtSBoldprimary => _textStyle(this,AppColors.primaryColor,Family.bold);
  TextStyle get txtBoldGrey => _textStyle(this,AppColors.greyHint,Family.semiBold);
  TextStyle get txtsemiBoldWhite => _textStyle(this,AppColors.white,Family.semiBold);

  TextStyle get txtBoldWhite => _textStyle(this,AppColors.white,Family.bold);
  TextStyle get txtBoldBlack => _textStyle(this,AppColors.black,Family.bold);
  TextStyle get txtBoldBtncolor => _textStyle(this,AppColors.btnColor,Family.bold);
  TextStyle get txtBoldGender => _textStyle(this,Color(0xff717171),Family.bold);
  TextStyle get txtBoldRed => _textStyle(this,Colors.red,Family.bold);
  TextStyle get txtRegularGrey => _textStyle(this, AppColors.grey, Family.regular);
  TextStyle get txtRegularGreen => _textStyle(this, Colors.green, Family.regular);
  TextStyle get txtRegularYellow => _textStyle(this, AppColors.quzeYellow, Family.regular);


  // TextStyle get txtBoldBlackText => _textStyle(this,AppColors.blackText,Family.bold);
  TextStyle get txtregularBtncolor => _textStyle(this,AppColors.btnColor,Family.medium);
  TextStyle get txtboldBtncolor => _textStyle(this,AppColors.btnColor,Family.semiBold);
  TextStyle get txtboldPrimary => _textStyle(this,AppColors.primaryColor,Family.bold);
  TextStyle get txtboldPfindHelpGrey=> _textStyle(this,AppColors.findHelp,Family.bold);
  TextStyle get txtboldgreen => _textStyle(this,AppColors.green,Family.bold);
  TextStyle get txtBoldForget => _textStyle(this,AppColors.forgetText,Family.bold);

  TextStyle get newgreyText => _textStyle(this, AppColors.grey, Family.regular);
  TextStyle get txtshare => _textStyle(this,AppColors.primaryBlue,Family.semiBold);
  TextStyle get txtfieldgrey => _textStyle(this, AppColors.txtfieldtext, Family.regular);

}


class Family {
  static const String light = 'Light';
  static const String regular = 'Regular';
  static const String medium = 'Medium';
  static const String semiBold = 'SemiBold';
  static const String bold = 'Bold';
  static const String splash = 'UnifrakturMaguntia-Regular';
}




TextStyle _textStyle(num size, color, family) => TextStyle(
     fontSize: size.numToDouble,
    color: color,
    fontFamily: family
  );
