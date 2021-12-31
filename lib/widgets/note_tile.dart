import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';
import 'package:rr_priscilla_abhulimen/styles/textstyles.dart';

class NoteTile extends StatefulWidget {
  final Note note;
  final onDelete;
  NoteTile({Key key, this.note, this.onDelete}) : super(key: key);

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryDark
      ),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: (){
                  print('edit note');
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.note.title,
                        style: AppTextStyles.title,
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
              )
          ),
          GestureDetector(
            onTap: widget.onDelete,
            child: Icon(
              Icons.close,
              color: Colors.red,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
