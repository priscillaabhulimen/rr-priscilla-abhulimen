import 'dart:convert';

Note noteFromJson(String str){
  final jsonData = json.decode(str);
  return Note.fromMap(jsonData);
}

String noteToJson(Note note){
  final val = note.toMap();
  return json.encode(val);
}

class Note{
  final int id;
  final String title;
  final String body;

  Note({this.id, this.title, this.body});

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    id: json['_id'],
    title: json['title'],
    body: json['body']
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'title': title,
    'body': body
  };
}