import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';

class NewNoteView extends StatefulWidget {
  final Note note;
  NewNoteView({
    Key key,
    this.note
  }) : super(key: key);

  @override
  _NewNoteViewState createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'New Note'
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.save_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Container(

      ),
    );
  }
}
