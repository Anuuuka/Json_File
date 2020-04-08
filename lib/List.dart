import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lab2_rpp/Todo.dart';
class CountyList extends StatelessWidget {
  final List<Todo> jdata;
  CountyList({Key key, this.jdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: jdata == null ? 0 : jdata.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                ListTile(
                  title : Text(jdata[index].name),
                  subtitle: Text(jdata[index].req1),
                  leading:  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    NetworkImage('https://raw.githubusercontent.com/wesleywerner/'
                        'ancient-tech/02decf875616dd9692b31658d92e64a20d99f816/src/images/tech/advanced_flight.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (context) => DetailScreen(todo: jdata[index]),
                        builder: (context) => DetailScreen(todo: jdata[index]),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}
class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.name),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(todo.req1, style: TextStyle(height: 2, fontSize: 20)),
              Text(todo.req2, style: TextStyle(height: 2, fontSize: 20)),
              Text(todo.graphic, style: TextStyle(height: 2, fontSize: 20)),
              Expanded(
                child: FittedBox(
                  child: Image.network('https://raw.githubusercontent.com/wesleywerner/'
                      'ancient-tech/02decf875616dd9692b31658d92e64a20d99f816/src/images/tech/advanced_flight.jpg'),
                ),
              ),
            ],
          )
      ),
    );
  }
}