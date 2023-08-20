import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{

   showtoast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void fieldFocus(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){
     currentFocus.unfocus();
     FocusScope.of(context).requestFocus(nextFocus);
  }
}