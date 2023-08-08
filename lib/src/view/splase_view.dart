import 'package:flutter/material.dart';
import 'package:mymodalview/src/view_model/servises/splash_servises.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServises splashServises = SplashServises();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServises.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Text("SPlash scren",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
