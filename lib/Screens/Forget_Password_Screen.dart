import 'package:chatapp/Custome_widget/yellow_Container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Forget PassWord Screen'),
        ),
        body: yellowContainer(
          height: height,
          width: width,
          data_for_Container: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  height: height * 0.08,
                  child: TextFormField(
                    controller: emailController,
                    validator: EmailValidator(errorText: 'Invalid Email '),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black45),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                  height: height * 0.07,
                  width: width / 2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black38),
                      onPressed: () {
                        auth.sendPasswordResetEmail(
                            email: emailController.text);
                      },
                      child: Text('Forget')))
            ],
          ),
        ));
  }
}
