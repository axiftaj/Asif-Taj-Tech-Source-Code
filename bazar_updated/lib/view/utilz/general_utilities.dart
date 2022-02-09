

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtilities {

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static void flushBarErrorMessage (String message, BuildContext context){

    showFlushbar(context: context, flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
        padding: const EdgeInsets.all(15),
        titleColor: Colors.white,

        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeOut,
    //  backgroundColor: MyColors.primaryColor,
      backgroundColor: const Color(0xffFD1D1D),
      flushbarPosition: FlushbarPosition.TOP,
      positionOffset: 20,
      messageText: Text(
        message,
         style : Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)
      ),
      icon: const  Icon(
        Icons.error,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
      //leftBarIndicatorColor: Colors.red[300],
    )..show(context));
  }
  static rSnackBar(String text, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ));
  }

  static height(value) {
    return SizedBox(
      height: value,
    );
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,

        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}