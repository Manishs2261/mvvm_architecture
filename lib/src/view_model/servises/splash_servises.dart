

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mymodalview/src/model/userModel/usermodel.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/view_model/user_view_model.dart';

class SplashServises{

  Future<UserModel> getUserData() =>UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{

    getUserData().then((value) async {

      if(value.token == "null" || value.token == '')
        {
          Navigator.pushNamed(context, RoutesName.login);
        }else
          {
           await Future.delayed(Duration(seconds: 3));
             Navigator.pushNamed(context, RoutesName.home);
          }

    }).onError((error, stackTrace) {

      if(kDebugMode){
        print(error.toString());
      }
    });
  }



}