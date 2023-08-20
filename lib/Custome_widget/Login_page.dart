import 'package:chatapp/Custome_widget/txt_form.dart';
import 'package:chatapp/Custome_widget/yellow_Container.dart';
import 'package:chatapp/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/Forget_Password_Screen.dart';
import '../Screens/SignUP.dart';
import 'Utils.dart';

class login_Page extends StatefulWidget {
  login_Page(
      {required this.emailController,
      required this.passwordController,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  double height;
  double width;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  State<login_Page> createState() => _login_PageState(
      height: height,
      width: width,
      emailController: emailController,
      passwordController: passwordController);
}

class _login_PageState extends State<login_Page> {
  _login_PageState(
      {required this.height,
      required this.width,
      required this.emailController,
      required this.passwordController});

  double height;
  double width;
  final key = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController passwordController;

  FirebaseAuth auth = FirebaseAuth.instance;

  login() {
    auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      utils().showtoast('Log in Sucessfully');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }).onError((error, stackTrace) {
      utils().showtoast(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                /// this is the Custome App bar of My Application
                yellowContainer(
                  height: height * 0.1,
                  boxDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 251, 166, 53),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  data_for_Container: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                /// this is the text form field
                txt_Form(
                  height: height,
                  width: width,
                  emailController: emailController,
                  passwordController: passwordController,
                ),

                /// this is the log in button
                Positioned(
                    top: height * 0.6,
                    left: width * 0.25,
                    child: InkWell(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          login();
                        }
                      },
                      child: yellowContainer(
                        height: height * 0.08,
                        width: width * 0.2,
                        radius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        data_for_Container: Center(
                            child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    )),

                /// this is the SignUp Text
                Positioned(
                  top: height * 0.75,
                  left: width * 0.15,
                  child: Row(
                    children: [
                      Text(
                        'if You Have No Account ! ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
                          child: Text('SignUp')),
                    ],
                  ),
                ),
                Positioned(
                  top: height * 0.80,
                  left: width * 0.15,
                  child: Row(
                    children: [
                      Text(
                        'if You Have No Password ! ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ));
                          },
                          child: Text('Forget')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
