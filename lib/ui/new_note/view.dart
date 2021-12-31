import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';
import 'package:rr_priscilla_abhulimen/widgets/buttons/action_button.dart';
import 'package:rr_priscilla_abhulimen/widgets/indicators/rr_loader.dart';

import '../notes_bloc.dart';

class NewNoteView extends StatefulWidget {
  final Note note;
  final onSave;
  NewNoteView({
    Key key,
    this.onSave,
    this.note
  }) : super(key: key);

  @override
  _NewNoteViewState createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  final bloc = NotesBloc();
  bool loading = false;

  TextEditingController titleCont = TextEditingController();
  TextEditingController bodyCont = TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  initNote(){
    if(widget.note != null){
      titleCont.text = widget.note.title;
      bodyCont.text = widget.note.body;
    }
  }

  @override
  void initState() {
    initNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'New Note'
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: loading ?  Center(
          child: RRSpinner(),
        ) : Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: AppTextStyles.title1,
                ),
                style: AppTextStyles.title1,
                maxLines: 1,
                keyboardType: TextInputType.text,
                controller: titleCont,
              ),
            ),
            Divider(
              color: AppColors.secondaryColor,
            ),
            Expanded(
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle: AppTextStyles.subtitle1
                  ),
                  keyboardType: TextInputType.multiline,
                  style: AppTextStyles.subtitle1,
                  expands: true,
                  maxLines: null,
                  controller: bodyCont,
                ),
              ),
            ),
            SizedBox(height: 12),
            AppButton(
                text: 'Save',
              onPressed: (){
                setState(() {
                  loading = true;
                });
                if(widget.note == null){
                  bloc.createNote(Note(
                      title: titleCont.text,
                      body: bodyCont.text
                  ));

                }
                else{
                  bloc.editNote(Note(
                    id: widget.note.id,
                    title: titleCont.text,
                    body: bodyCont.text,
                  ));
                }
                setState(() {
                  loading = false;
                });
                if(Navigator.of(context).canPop()) Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
