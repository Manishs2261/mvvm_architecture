import 'package:flutter/material.dart';
import 'package:mymodalview/src/utils/routes/routes.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/view/login_screen.dart';
import 'package:mymodalview/src/view_model/auth_viewmodel.dart';
import 'package:mymodalview/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[

          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),


        ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashview,
      onGenerateRoute: Routes.generateRoute,
    ),) ;
  }
}

