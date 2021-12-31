import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/ui/new_note/view.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Notes List'
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, RRPageRoute.routeTo(
                builder: (_) => NewNoteView()
              ));
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
    );
  }
}
