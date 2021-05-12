import 'package:dorry_v1/app/locator.dart';
import 'package:dorry_v1/app/router.gr.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff46b7bf),
        accentColor: Color(0xffffae48),
        iconTheme: IconThemeData(color: Color(0xffc4c4c4)),
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.getStartedView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
