import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';

class NoteTile extends StatefulWidget {
  final Note note;
  final onDelete;
  final onCancel;
  final Function onTap;
  NoteTile({Key key, this.note, this.onDelete, this.onTap, this.onCancel}) : super(key: key);

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {

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
          barrierDismissible: false,
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
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      widget.onCancel();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 14
                        ),
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
          child: Row(
            children: [
              Expanded(
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
              SizedBox(width: 10),
              Icon(
                Icons.edit_outlined,
                color: AppColors.primaryColor,
                size: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
