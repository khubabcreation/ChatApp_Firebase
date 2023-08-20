import 'package:chatapp/Custome_widget/Login_page.dart';
import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:chatapp/Screens/HomeScreen.dart';
import 'package:chatapp/Screens/SignUP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


import '../Custome_widget/txt_form.dart';
import '../Custome_widget/yellow_Container.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.height - kToolbarHeight;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: login_Page(
            height: height,
            width: width,
            emailController: emailController,
            passwordController: passwordController),
      ),
    );
  }
}
