import 'package:chatapp/Documents/Sub_Documents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/Model_Dox.dart';
import 'Again_Sub_Documents.dart';
import 'Documentes.dart';

class MultiButton_Screen extends StatefulWidget {
  const MultiButton_Screen({Key? key}) : super(key: key);

  @override
  State<MultiButton_Screen> createState() => _MultiButton_ScreenState();
}

class _MultiButton_ScreenState extends State<MultiButton_Screen> {
  final dbref = FirebaseFirestore.instance.collection('Class');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Button Screen'),
      ),
      body: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    dbref.doc().set({
                      'Name': 'abbsi',
                      'Fname': 'ali',
                    });
                  },
                  child: Text('Upload To Model')),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgainSubDocumentScreen(),
                        ));
                  },
                  child: Text('Upload Sub Docx')),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {}, child: Text('Upload Sub Docx Again')),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ModelDocx();
                      },
                    ));
                  },
                  child: Text('Show Model Data')),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubDocumentScreen(),
                    ));
                  },
                  child: Text('Get Sub Docx')),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AgainSubDocumentScreen(),
                    ));
                  },
                  child: Text('Get Sub Docx Again')),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          )),
    );
  }
}
