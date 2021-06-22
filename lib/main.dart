import 'package:flutter/material.dart';
import 'package:settl_proj/presentation/sign_in_page.dart';
import 'package:settl_proj/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SETTL PROJECT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: UserSignInPage(),
      initialRoute: "/signIn",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
