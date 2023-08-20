import 'package:chatapp/Custome_widget/Login_page.dart';
import 'package:chatapp/Documents/Multi_Button_Screen.dart';
import 'package:chatapp/Documents/Querry_Building_Prac.dart';
import 'package:chatapp/Screens/SignIn.dart';
import 'package:chatapp/Screens/Splash_Screen.dart';
import 'package:chatapp/read_data_from_firestore/add_items.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/Collection_Experiment.dart';
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:AddData(),

      //login_Page(emailController:controller , passwordController: controller1, height: height, width: width),
    );
  }
}
