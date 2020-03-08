import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayData(),
    );
  }
}


class DisplayData extends StatefulWidget {
  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  List data;
  // Future getData() async{
  //   FutureBuilder(future: DefaultAssetBundle.of(context).loadString('data/json_data.json'),
  //   builder: (context,snapshot){
  //     var newData = jso(snapshot.data.toString());
  //  print(newData);
     
  //   },);

  // }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON DATA FETCH'),
        centerTitle: true
      ),
      body:Container(
        
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('data/json_data.json'),
          builder: (context,snapshot){     
             var newData = jsonDecode(snapshot.data.toString());      
             return ListView.builder(
               itemBuilder: (BuildContext context,int index){
               return Card(
                 elevation: 20.0,
                 color: Colors.deepOrange,
                 child: Column(
                   children:[
                     
                     Text("name: " + newData[index]['name'],
                     style: TextStyle(color:Colors.white),),
                     Text("Height: " + newData[index]['height']),
                            Text("Mass: " + newData[index]['mass']),
                            Text(
                                "Hair Color: " + newData[index]['hair_color']),
                            Text(
                                "Skin Color: " + newData[index]['skin_color']),
                            Text(
                                "Eye Color: " + newData[index]['eye_color']),
                            Text(
                                "Birth Year: " + newData[index]['birth_year']),
                            Text("Gender: " + newData[index]['gender'])
                     

                   ]
                 ),
               );
             },
             itemCount: newData==null?0: newData.length,
             );
          },
        ),
      )
      
    );
  }
}