import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth extends StatefulWidget {
  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  bool isUserLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void _loginWithGoogle() async {
    try {
      var result = await _googleSignIn.signIn();
      setState(() {
        isUserLoggedIn = true;
        print(result);
      });
    } catch (error) {
      print(error);
    }
  }

  void logout() {
    var result = _googleSignIn.signOut();
    setState(() {
      isUserLoggedIn = false;
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.orange,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isUserLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // when loggedIn
                    Image.network(_googleSignIn.currentUser.photoUrl),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Name : " +
                            _googleSignIn.currentUser.displayName +
                            "\nEmail : " +
                            _googleSignIn.currentUser.email +
                            "\nScopes : " +
                            _googleSignIn.scopes.toString() +
                            "\nID : " +
                            _googleSignIn.currentUser.id,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        logout();
                      },
                      child: Text("Logout",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // when user is not loggedIn
                    RaisedButton(
                      onPressed: () {
                        _loginWithGoogle();
                      },
                      child: Text("Login with Google",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
