import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/view/home_screen.dart';
import 'package:mymodalview/src/view/login_screen.dart';
import 'package:mymodalview/src/view/sign_view.dart';
import 'package:mymodalview/src/view/splase_view.dart';

class Routes{

  static  Route<dynamic> generateRoute(RouteSettings settings){

    final argume = settings.arguments;

    switch(settings.name)
        {
      case RoutesName.splashview:
        return MaterialPageRoute(builder: (BuildContext contex) => SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext contex) => HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext contex) => LoginScreen());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext contex) => SignUpView());

      default:

        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No routs defind'),
            ),
          );
        });
    }
  }
}