import 'package:chatapp/Screens/Splash_Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();
  @override
  void initState() {
    super.initState();
    services.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Splash Screen'),),
      body: Container(
        color: Colors.black26,
        child: Center(child: Text('Chat App')),
      ),
    );
  }
}
