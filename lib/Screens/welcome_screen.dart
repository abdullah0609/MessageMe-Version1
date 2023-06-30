import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/Screens/registeration_screen.dart';
import 'package:message_app/Screens/signin_screen.dart';
import '../Widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('Images/meetme.png'),
                ),
                Text(
                  "MessageMe",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2e386b)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
                color: Colors.yellow[900]!,
                title: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.screenRoute);
                }
            ),
            MyButton(
                color: Colors.purple[800]!,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterationSystem.screenRoute);
                }
            )
          ],
        ),
      ),
    );
  }
}


