
import 'package:flutter/cupertino.dart';
import 'package:momgreta/utils/extensions/size.dart';


extension OnNumWidget on num{
  SizedBox get height => SizedBox(height: getDouble.sdp,);
  SizedBox get width => SizedBox(width: getDouble.sdp,);
}