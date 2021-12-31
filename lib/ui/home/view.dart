import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/core/services/database_service.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';
import 'package:rr_priscilla_abhulimen/ui/new_note/view.dart';
import 'package:rr_priscilla_abhulimen/ui/notes_bloc.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';
import 'package:rr_priscilla_abhulimen/widgets/indicators/rr_loader.dart';
import 'package:rr_priscilla_abhulimen/widgets/note_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = NotesBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Notes List'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, RRPageRoute.routeTo(builder: (_) => NewNoteView()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: DatabaseServices.db.getAllNotes,
        child: StreamBuilder<List<Note>>(
          stream: bloc.notes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: RRSpinner(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.data == null || snapshot.data.length == 0) {
              return Center(
                child: Text(
                  'You have no notes yet. Tap the \'+\' to create a new note.',
                  style: AppTextStyles.subtitle1,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Note item = snapshot.data[index];
                return NoteTile(note: item, onDelete: bloc.deleteNote(item));
              },
            );
          },
        ),
      ),
    );
  }
}
