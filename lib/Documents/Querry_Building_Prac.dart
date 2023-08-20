import 'package:chatapp/Documents/Documentes.dart';
import 'package:chatapp/Firebase_Data/Firebase_Fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QurerryBinding extends StatefulWidget {
  const QurerryBinding({Key? key}) : super(key: key);

  @override
  State<QurerryBinding> createState() => _QurerryBindingState();
}

class _QurerryBindingState extends State<QurerryBinding> {
  final data1Controller = TextEditingController();
  final data2Controller = TextEditingController();
  final data3Controller = TextEditingController();
  final idController = TextEditingController();
  
  final dbref = FirebaseFirestore.instance.collection('Class');


  @override
  void dispose() {
    super.dispose();
    data1Controller.dispose();
    data2Controller.dispose();
    data3Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Querry Class'),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.cyan,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: idController,
                decoration: InputDecoration(labelText: 'Enter your id'),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextFormField(
              controller: data1Controller,
              decoration: InputDecoration(labelText: 'Enter your data1'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextFormField(
              controller: data2Controller,
              decoration: InputDecoration(labelText: 'Enter your data2'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextFormField(
              controller: data3Controller,
              decoration: InputDecoration(labelText: 'Enter your data3'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            ElevatedButton(onPressed: () {
              String id  = idController.text;
              int myint = int.parse(id);

              dbref.doc(id).set({
                'id':myint,
                 'dataone' :data1Controller.text,
                 'datatwo': data2Controller.text,
                'datathree': data3Controller.text
              });
             Navigator.push(context, MaterialPageRoute(builder: (context) =>DocumentScreen(),));

            }, child: Text('Submitted'))
          ],
        ),
      ),
    );
  }
}
