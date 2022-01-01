import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/core/services/database_service.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_app_notification.dart';
import 'package:sqflite/sqflite.dart';

class NotesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetNotes extends NotesEvent{

}

class DeleteNote extends NotesEvent{
  final _note;

  DeleteNote(this._note);
  @override
  // TODO: implement props
  List<Object> get props => [_note];
}


class NotesState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NotesIsNotFetched extends NotesState{

}

class NotesIsLoading extends NotesState{

}

class NotesIsLoaded extends NotesState{
  final _notes;

  NotesIsLoaded(this._notes);

  List<Note> get getNotes => _notes;
  @override
  // TODO: implement props
  List<Object> get props => [_notes];
}

class NotesIsNotLoaded extends NotesState{

}

class NoteIsDeleting extends NotesState{

}

class NoteIsNotDeleted extends NotesState{

}


class NotesBloc extends Bloc<NotesEvent, NotesState>{
  DatabaseServices db;

  NotesBloc(NotesState initialState, this.db) : super(initialState);

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async*{
    if(event is GetNotes){
      yield NotesIsLoading();

      try{
        List<Note> notes = await db.getAllNotes();
        AppNotification.success(message: 'Successfully fetched notes');
        yield NotesIsLoaded(notes);
      }
      catch(e){
        yield NotesIsNotLoaded();
        AppNotification.error(message: 'Error occurred while fetching notes');
      }
    }
    else if(event is DeleteNote){
      yield NoteIsDeleting();

      try{
        await db.deleteNote(event._note);
        AppNotification.success(message: 'Successfully deleted ${event._note.title}');
        yield NotesIsLoading();

        try{
          List<Note> notes = await db.getAllNotes();
          yield NotesIsLoaded(notes);
        }
        catch(e){
          AppNotification.error(message: 'Error occurred while fetching notes');
          yield NotesIsNotFetched();
        }
      }
      catch(e){
        AppNotification.error(message: 'Error occurred while deleting note');
        yield NoteIsNotDeleted();
      }
    }
  }
}