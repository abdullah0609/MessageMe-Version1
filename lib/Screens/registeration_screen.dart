import 'package:flutter/material.dart';
import 'package:message_app/Screens/chat_screen.dart';
import 'package:message_app/Widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterationSystem extends StatefulWidget {
  static const String screenRoute = 'register_screen';

  const RegisterationSystem({super.key});

  @override
  State<RegisterationSystem> createState() => _RegisterationSystemState();
}

class _RegisterationSystemState extends State<RegisterationSystem> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;


  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Text(
            "MessageMe",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall:showSpinner,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 180,
                      child: Image.asset('Images/meetme.png'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow[900]!,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple[900]!,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ))),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow[900]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple[900]!,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                        color: Colors.purple[800]!,
                        title: 'Register',
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.pushNamed(context, ChatScreen.screenRoute);
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        }),
                  ])),
        ));
  }
}
