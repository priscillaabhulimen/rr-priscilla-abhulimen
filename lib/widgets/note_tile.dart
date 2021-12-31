import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';
import 'package:rr_priscilla_abhulimen/ui/new_note/view.dart';
import 'package:rr_priscilla_abhulimen/ui/notes_bloc.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';

class NoteTile extends StatefulWidget {
  final Note note;
  final onDelete;
  final Function onTap;
  NoteTile({Key key, this.note, this.onDelete, this.onTap}) : super(key: key);

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  final bloc = NotesBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: AppColors.primaryColor,
        alignment: Alignment.centerRight,
        child: Text(
        'Delete',
        style: AppTextStyles.subtitle1,
      ),),
      key: UniqueKey(),
      onDismissed: (dir){
        showDialog(
            context: context,
            builder: (context){
              return CupertinoAlertDialog(
                content: Text(
                  'You are about to delete this note, do you wish to continue?'
                ),
                title: Text(
                  'Delete Confirmation',
                ),
                actions: [
                  GestureDetector(
                    onTap: (){
                      widget.onDelete();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        'Yes',
                        style: AppTextStyles.subtitle1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      bloc.getNotes();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        'No',
                        style: AppTextStyles.subtitle1
                      ),
                    ),
                  )
                ],
              );
            }
        );
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.secondaryDark,
              border: Border.all(color: AppColors.primaryColor)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.title,
                style: AppTextStyles.title2,
              ),
              SizedBox(height: 6),
              Text(
                widget.note.body,
                style: AppTextStyles.subtitle2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
