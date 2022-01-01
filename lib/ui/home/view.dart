import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/core/services/database_service.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';
import 'package:rr_priscilla_abhulimen/ui/home/bloc.dart';
import 'package:rr_priscilla_abhulimen/ui/new_note/notes_bloc.dart';
import 'package:rr_priscilla_abhulimen/ui/new_note/view.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';
import 'package:rr_priscilla_abhulimen/widgets/buttons/action_button.dart';
import 'package:rr_priscilla_abhulimen/widgets/indicators/rr_loader.dart';
import 'package:rr_priscilla_abhulimen/widgets/note_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (context) => NotesBloc(NotesIsNotFetched(), DatabaseServices.db),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state){
          final noteBloc = BlocProvider.of<NotesBloc>(context);
          if(state is NotesIsNotFetched){
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text('Notes List'),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        final noteBloc = BlocProvider.of<NotesBloc>(context);
                        Navigator.push(context,
                            RRPageRoute.routeTo(builder: (_) => NewNoteView())).then((_){
                          noteBloc.add(GetNotes());
                        });
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
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Center(
                    child: AppButton(
                      text: 'Get Notes',
                      onPressed: (){
                        noteBloc.add(GetNotes());
                      },
                    ),
                  ),
                )
            );
          }
          else if(state is NotesIsLoading || state is NoteIsDeleting){
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text('Notes List'),
                actions: [
                  GestureDetector(
                    onTap: () {
                      final noteBloc = BlocProvider.of<NotesBloc>(context);
                      Navigator.push(context,
                          RRPageRoute.routeTo(builder: (_) => NewNoteView())).then((_){
                        noteBloc.add(GetNotes());
                      });
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
              body: Center(
                child: RRSpinner(),
              ),
            );
          }
          else if(state is NotesIsLoaded){
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text('Notes List'),
                actions: [
                  GestureDetector(
                    onTap: () {
                      final noteBloc = BlocProvider.of<NotesBloc>(context);
                      Navigator.push(context,
                          RRPageRoute.routeTo(builder: (_) => NewNoteView())).then((_){
                        noteBloc.add(GetNotes());
                      });
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
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: ListView.builder(
                  itemCount: state.getNotes.length,
                  itemBuilder: (context, index) {
                    Note item = state.getNotes[index];
                    return Column(
                      children: [
                        NoteTile(
                          note: item,
                          onDelete: () {
                            noteBloc.add(DeleteNote(item));
                          },
                          onCancel: (){
                            noteBloc.add(GetNotes());
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                RRPageRoute.routeTo(
                                    builder: (_) => NewNoteView(
                                      note: item,
                                    ))).then((_){
                              noteBloc.add(GetNotes());
                            });
                          },
                        ),
                        SizedBox(height: 10)
                      ],
                    );
                  },
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text('Notes List'),
              actions: [
                GestureDetector(
                  onTap: () {
                    final noteBloc = BlocProvider.of<NotesBloc>(context);
                    Navigator.push(context,
                        RRPageRoute.routeTo(builder: (_) => NewNoteView())).then((_){
                      noteBloc.add(GetNotes());
                    });
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
            body: Center(
              child: Column(
                children: [
                  Text(
                    'Oops, looks like an error occurred',
                    style: AppTextStyles.subtitle1,
                  ),
                  SizedBox(height: 10),
                  AppButton(text: 'Try Again', onPressed: (){
                    noteBloc.add(GetNotes());
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
