import 'package:flutter/material.dart';
import 'package:rr_priscilla_abhulimen/ui/home/view.dart';
import 'package:rr_priscilla_abhulimen/utils/rr_page_route.dart';



class RRRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return RRPageRoute.routeTo(builder: (_) => HomeView());
        break;
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
