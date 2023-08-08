import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mymodalview/src/respository/auth_repository.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  //=======================================
  bool _signloading = false;
  bool get signloading =>_signloading;

  setSignLoading(bool value){
    _signloading = value;
    notifyListeners();
  }

  //=======================================
  bool _loading = false;
  bool get loading =>_loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  //============================login method==========

  Future<void> loginApi(dynamic data,BuildContext context) async{

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);
Utils.flushBarErrorMessage("login succefully", context);
      Utils.toastMessage("manish");
      print("masni");
Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){

      setLoading(false);
      Utils.toastMessage(error.toString());
       if(kDebugMode)
         {
           print(error.toString());
         }
    });

  }

  //=========================sign method ======================

  Future<void> signApi(dynamic data,BuildContext context) async{

    setSignLoading(true);

    _myRepo.signUpApi(data).then((value){
      setSignLoading(false);
      Utils.flushBarErrorMessage("Sign up succefully", context);


      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){

      setSignLoading(false);
      Utils.toastMessage(error.toString());
      if(kDebugMode)
      {
        print(error.toString());
      }
    });

  }
}