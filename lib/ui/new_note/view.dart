import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key key}) : super(key: key);

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
