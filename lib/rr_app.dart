import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rr_priscilla_abhulimen/router.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';

import 'app/locator.dart';
import 'core/services/navigation_service.dart';

class RedAndRedApp extends StatelessWidget {
  final bool isDebug;

  const RedAndRedApp({
    Key key,
    this.isDebug = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: isDebug,
          title: 'RRApp',
          navigatorKey: locator<NavigationService>().navigatorKey,
          theme: ThemeData(
            fontFamily: 'PlusJakartaDisplay',
            scaffoldBackgroundColor: AppColors.secondaryDark,
          ),
          onGenerateRoute: RRRouter.generateRoute,
          initialRoute: '/',
        ),
      );
  }
}