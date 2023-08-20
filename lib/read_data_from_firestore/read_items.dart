import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Data '),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.brown,
      ),
    );
  }
}
