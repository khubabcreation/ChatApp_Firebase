import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final key = GlobalKey<FormState>();
  late final dbref;

  @override
  void initState() {
    super.initState();
    dbref = FirebaseFirestore.instance.collection('multan');
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    fatherNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Data '),
      ),
      body: Form(
        key: key,
        child: Container(
          height: height,
          width: width,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(hintText: 'Enter your first Name'),
              ),
              TextFormField(
                controller: secondNameController,
                decoration: InputDecoration(hintText: 'Enter your Second Name'),
              ),
              TextFormField(
                controller: fatherNameController,
                decoration:
                    InputDecoration(hintText: 'Enter your Father Name  Name'),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await dbref.doc().set({
                      'first_name': firstNameController.text.toString(),
                      'second_name': secondNameController.text.toString(),
                      'father_name': fatherNameController.text.toString()
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('user has been added sucessfully')));
                    });
                  },
                  child: Text('Submitted data'))
            ],
          ),
        ),
      ),
    );
  }
}
