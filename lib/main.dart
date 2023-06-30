import 'package:flutter/material.dart';
import 'package:message_app/Screens/welcome_screen.dart';
import 'Screens/chat_screen.dart';
import 'Screens/registeration_screen.dart';
import 'Screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MessageMe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SignInScreen.screenRoute: (context) => SignInScreen(),
        RegisterationSystem.screenRoute: (context) => RegisterationSystem(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      });
  }
}