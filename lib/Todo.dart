class Todo {
  final String name;
  final String req1;
  final String req2;
  final String graphic;

  Todo({this.name, this.req1, this.graphic, this.req2});

  factory Todo.fromJson(Map<String, dynamic> json){
    return new Todo(
      name : json['name'],
      req1 : json['req1'] as String ,
      graphic: json['graphic'],
      req2: json['req2'],
    );
  }
}