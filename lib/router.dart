import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';



class RRRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return RRPageRoute.routeTo(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          ),
        );
    }
  }
}
