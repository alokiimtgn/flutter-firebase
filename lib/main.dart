import 'package:flutter/material.dart';
import 'screens/app_main_screen.dart';
import 'screens/google_auth_screen.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.GOOGLE_AUTH: (context) => GoogleAuth(),
      },
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Firebase"),
          ),
          body: AppMainScreen(),
        ),
      ),
    );
  }
}

