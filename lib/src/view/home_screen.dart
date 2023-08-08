import 'package:flutter/material.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final usePrefrence = Provider.of<UserViewModel>(context);
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("home"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: (){
                usePrefrence.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Text("Logout"),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
