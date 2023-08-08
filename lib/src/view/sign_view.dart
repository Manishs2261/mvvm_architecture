import 'package:flutter/material.dart';
import 'package:mymodalview/src/res/components/round_button.dart';
import 'package:mymodalview/src/utils/routes/routes_names.dart';
import 'package:mymodalview/src/utils/utils.dart';
import 'package:mymodalview/src/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  ValueNotifier<bool> _odsecurPassword = ValueNotifier<bool>(true);

  TextEditingController _emailComntroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode  = FocusNode();
  FocusNode passFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _odsecurPassword.dispose();
    _emailComntroller.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();

  }


  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text("sign Up "),
      ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                controller: _emailComntroller,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(

                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.alternate_email)
                ),
                onFieldSubmitted: (value){

                  Utils.fieldFocusChange(context, emailFocusNode, passFocusNode);

                },
              ),

              ValueListenableBuilder(
                  valueListenable: _odsecurPassword,
                  builder: (context,value,child){
                    return   TextFormField(
                      obscureText: _odsecurPassword.value,
                      obscuringCharacter: "*",
                      controller: _passwordController,
                      focusNode: passFocusNode,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: InkWell(
                            onTap: (){
                              _odsecurPassword.value = !_odsecurPassword.value;
                            },
                            child: Icon(
                                _odsecurPassword.value ? Icons.visibility_off : Icons.visibility)
                        ),

                      ),
                    );
                  }),
              SizedBox(height:height * .05),

              RoundButton(
                title: "Sign UP",
                loading: authViewModel.signloading,
                onPress: (){
                  if(_emailComntroller.text.isEmpty){

                    Utils.flushBarErrorMessage("Please Enter Eamil", context);

                  }else if(_passwordController.text.isEmpty){

                    Utils.flushBarErrorMessage("Pleae Enter Password", context);

                  }else if(_passwordController.text.length <6){

                    Utils.flushBarErrorMessage("Please Enter 6 digits password", context);
                  }else{

                    Map data = {
                      "email": _emailComntroller.text.toString(),
                      "password":_passwordController.text.toString(),
                    };
                    authViewModel.signApi(data,context);
                    Utils.toastMessage("sing");
                  }
                },
              ),

              InkWell(

                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have a account "),
              )
            ],
          ),
        )
    );
  }
}
