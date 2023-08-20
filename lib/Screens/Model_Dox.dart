import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Class_Model.dart';

class ModelDocx extends StatefulWidget {
  const ModelDocx({Key? key}) : super(key: key);

  @override
  State<ModelDocx> createState() => _ModelDocxState();
}

///   Here we show data with model Class............................
class _ModelDocxState extends State<ModelDocx> {
  List<Class> fetchlist = [];

  @override
  void initState() {
    super.initState();
   // fetchRecords();
         FirebaseFirestore.instance.collection('Class').snapshots().listen((event) {
           datatoMap(event);
         });
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance.collection('Class').get();
    datatoMap(records);
  }

  datatoMap(QuerySnapshot<Map<String, dynamic>> records) {
    // for(var doc in records.docs){
    //   doc.get("");
    //   Class c = Class(fname:doc.get(""),id: doc.id,name: doc.get(""));
    //   fetchlist.add(c);
    var _list = records.docs
        .map((e) => Class(id: e.id, name: e['Name'], fname: e['Fname']))
        .toList();
    setState(() {
      fetchlist = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Model data'),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          child: ListView.builder(
            itemCount: fetchlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(index.toString()),
                ),
                title: Text(fetchlist[index].name.toString()),
                subtitle: Text(fetchlist[index].id.toString()),
                trailing: Text(fetchlist[index].fname.toString()),
              );
            },
          ),
        ));
  }
}
