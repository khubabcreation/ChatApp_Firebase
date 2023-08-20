import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:chatapp/Custome_widget/yellow_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class txt_Form extends StatefulWidget {
    txt_Form({required this.emailController,required this.passwordController,required this.height,required this.width,Key? key}) : super(key: key);
  double height;
  double width;
  TextEditingController emailController;
  TextEditingController passwordController;



  @override
  State<txt_Form> createState() => _txt_FormState(height,width);
}

class _txt_FormState extends State<txt_Form> {
  _txt_FormState(this.height,this.width);
  double height;
  double width;
  final emailfocus = FocusNode();
  final passwordfocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    widget.emailController.dispose();
    widget.passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Positioned(
          top: height * 0.25,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: yellowContainer(
              height: height * 0.3,
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
                        onFieldSubmitted: (value){

                          utils.fieldFocus(context, emailfocus, passwordfocus);
                        },
                        validator: EmailValidator(
                            errorText: 'invalid Email'),
                        controller: widget.emailController,
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
                      maxLength: 8,
                        obscureText: true,
                        validator:
                        RequiredValidator(errorText: '*Required'),
                        controller: widget.passwordController,
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
                ],
              ),
            ),
          )),
    );
  }
}
