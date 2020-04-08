/*import 'package:flutter/material.dart';
import 'dart:convert';

void main(){
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green,
      ),
      home: JsonPage()));
}
class JsonPage extends StatefulWidget{
  @override
  _JsonPageState createState() => _JsonPageState();
}
class _JsonPageState extends State<JsonPage>{
  List data;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Load Json File"),),
      body: Container(
        child: FutureBuilder(
          future:DefaultAssetBundle.of(context).loadString("assets/Technology.json"),
          builder:(BuildContext context, AsyncSnapshot snapshot){
            var jdata = json.decode(snapshot.data.toString());
            if(snapshot.data==null)
            {
              return Container(child:Center(child:Text("Loading..."),));
            }else{
              return ListView.builder(
                itemCount: jdata == null ? 0 : jdata.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ListTile(
                          title : Text(jdata[index]['name']),
                          subtitle: Text(jdata[index]['req1']),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}*/
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab2_rpp/Todo.dart';
import 'package:lab2_rpp/List.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Technology file",
            style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/Technology.json'),
                builder: (context, snapshot) {
                  List<Todo> countries =
                  parseJosn(snapshot.data.toString());
                  return !countries.isEmpty
                      ? new CountyList(jdata: countries)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        ));
  }

  List<Todo> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Todo>((json) => new Todo.fromJson(json)).toList();
  }
}
