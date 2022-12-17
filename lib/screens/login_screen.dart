import 'package:cuadro/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            context.read<FirebaseAuthMethods>().signInAnonymously(context);
          },
          child: Text(
            "Login Anonymously",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Please login to start playing!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      //fontWeight: bold
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/images/icon2.png',
                        fit: BoxFit.contain,
                      )),
                  SizedBox(height: 25),
                  SignInButton(Buttons.Google, onPressed: () {
                    context
                        .read<FirebaseAuthMethods>()
                        .signInWithGoogle(context);
                  }),
                  SizedBox(height: 20),
                  loginButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );

    /*
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            
            ),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signInAnonymously(context);
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
    */
  }
}
