import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../Custome_widget/Utils.dart';
import '../Custome_widget/yellow_Container.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final key = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailfocus = FocusNode();
  final passwordfocus = FocusNode();
  final confirmpasswordfocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordfocus.dispose();
    confirmpasswordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: key,
          child: Container(
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
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                /// this is the text form field
                Positioned(
                    top: height * 0.25,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: yellowContainer(
                        height: height * 0.4,
                        width: width * 0.45,
                        boxDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 166, 53),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        data_for_Container: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: TextFormField(
                                  focusNode: emailfocus,
                                  onFieldSubmitted: (value) {
                                    utils.fieldFocus(
                                        context, emailfocus, passwordfocus);
                                  },
                                  controller: emailController,
                                  maxLength: 22,
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: '*Required'),
                                    EmailValidator(errorText: 'Invalid Email')
                                  ]),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    label: Text('Email'),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: TextFormField(
                                  focusNode: passwordfocus,
                                  onFieldSubmitted: (value) {
                                    utils.fieldFocus(context, passwordfocus,
                                        confirmpasswordfocus);
                                  },
                                  controller: passwordController,
                                  maxLength: 8,
                                  obscureText: true,
                                  validator:
                                      RequiredValidator(errorText: '*Required'),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    label: Text('Password'),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: TextFormField(
                                  focusNode: confirmpasswordfocus,
                                  maxLength: 8,
                                  obscureText: true,
                                  validator:
                                      RequiredValidator(errorText: '*Required'),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    label: Text('Confirm Password'),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),

                /// this is the Sign up button
                Positioned(
                    top: height * 0.7,
                    left: width * 0.25,
                    child: InkWell(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            print('user added');
                          });

                          Navigator.pop(context);
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
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    )),

                /// this is the icon row
                Positioned(
                    top: height * 0.85,
                    left: width * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              ///write the code here
                            },
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.1,
                              child: Image.asset('images/facebook.png',
                                  fit: BoxFit.contain,
                                  color: Color.fromARGB(255, 251, 166, 53)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              ///write the code here
                            },
                            child: Container(
                              height: height * 0.07,
                              width: width * 0.07,
                              child: Image.asset('images/google.png',
                                  fit: BoxFit.cover,
                                  color: Color.fromARGB(255, 251, 166, 53)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              ///write the code here
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.06,
                              child: Image.asset('images/final.png',
                                  fit: BoxFit.cover,
                                  color: Color.fromARGB(255, 251, 166, 53)),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
