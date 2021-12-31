import 'dart:async';

import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/core/services/database_service.dart';

class NotesBloc{
  NotesBloc(){
    getNotes();
  }
  
  final _noteController = StreamController<List<Note>>.broadcast();
  get notes => _noteController.stream;
  
  dispose(){
    _noteController.close();
  }
  
  getNotes() async{
    _noteController.sink.add(await DatabaseServices.db.getAllNotes());
  }
  
  deleteNote(Note note){
    DatabaseServices.db.deleteNote(note);
    getNotes();
  }
  
  createNote(Note note){
    DatabaseServices.db.createNote(note);
    getNotes();
  }
  
  editNote(Note note){
    DatabaseServices.db.updateNote(note);
    getNotes();
  }
}