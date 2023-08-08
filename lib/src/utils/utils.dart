import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  //============focuse node ====================

  static void fieldFocusChange(BuildContext context,
          FocusNode current,
          FocusNode nextFocus){

    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }





  //===========toast==============
 static toastMessage(String message){

Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.red,
    fontSize: 20,
    toastLength: Toast.LENGTH_SHORT,
);
 }

//=======flush bar ================

 static void flushBarErrorMessage(String message, BuildContext context){

   showFlushbar(context: context,
       flushbar: Flushbar(
         message: message,
         forwardAnimationCurve: Curves.decelerate,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         padding: EdgeInsets.all(15),
         reverseAnimationCurve: Curves.easeInOut,
         icon: Icon(Icons.error,size: 28,color: Colors.white,),
         flushbarPosition: FlushbarPosition.TOP,
         borderRadius: BorderRadius.circular(20),
         backgroundColor: Colors.black,



         duration: Duration(seconds: 3),
       )..show(context)
   );
 }


 //========snakBar ==============

static snakBar(String message, BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(

     SnackBar(
         backgroundColor: Colors.yellow,
         content: Text(message,style: TextStyle(color: Colors.black,fontSize: 20),)),
   );
}

}