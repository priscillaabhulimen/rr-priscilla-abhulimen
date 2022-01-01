import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rr_priscilla_abhulimen/core/services/database_service.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_app_notification.dart';

class SaveEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CreateNote extends SaveEvent{
  final _note;

  CreateNote(this._note);
  @override
  // TODO: implement props
  List<Object> get props => [_note];
}

class EditNote extends SaveEvent{
  final _note;

  EditNote(this._note);
  @override
  // TODO: implement props
  List<Object> get props => [_note];
}


class SaveNotesState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NotesIsNotSaved extends SaveNotesState{

}

class NotesIsSaving extends SaveNotesState{

}

class NoteIsEditing extends SaveNotesState{

}



class SaveNotesBloc extends Bloc<SaveEvent, SaveNotesState>{
  DatabaseServices db;

  SaveNotesBloc(SaveNotesState initialState, this.db) : super(initialState);

  @override
  Stream<SaveNotesState> mapEventToState(SaveEvent event) async*{
    if(event is CreateNote){
      yield NotesIsSaving();

      try{
        await db.createNote(event._note);
        AppNotification.success(message: 'Note created successfully');
      }
      catch(e){
        AppNotification.error(message: 'Error occurred while creating note');
      }
    }
    else if(event is EditNote){
      yield NoteIsEditing();

      try{
        await db.updateNote(event._note);
        AppNotification.success(message: 'Note edited successfully');
      }
      catch(e){
        AppNotification.error(message: 'Error occurred while updating note');
      }
    }
  }
}