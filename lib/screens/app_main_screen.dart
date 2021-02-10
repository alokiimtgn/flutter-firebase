import 'package:flutter/material.dart';
import '../routes/routes.dart';

class AppMainScreen extends StatefulWidget {
  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                // Navigate to Google Auth Screen
                Navigator.pushNamed(context, Routes.GOOGLE_AUTH);
              },
              child: Text("Google Auth"),
            ),
          ],
        ),
      ),
    );
  }
}
