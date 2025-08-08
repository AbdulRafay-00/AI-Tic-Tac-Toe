import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_flutter/Game_page.dart';
import 'package:tic_tac_flutter/ModeSelectionPage.dart';
import 'package:tic_tac_flutter/PhoneNumberLogin.dart';
import 'package:tic_tac_flutter/Signup_Page.dart';
import 'package:tic_tac_flutter/toast/utilities_toast.dart';

import 'firebase_options.dart';

class Login_Page extends StatefulWidget {
  Login_Page({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final Email_controller = TextEditingController();
  final Password_controller = TextEditingController();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    Email_controller.dispose();
    Password_controller.dispose();
    super.dispose();
  }

  void Login() {
    _auth
        .signInWithEmailAndPassword(
          email: Email_controller.text,
          password: Password_controller.text,
        )
        .then((value) {
          setState(() {
            loading = false;
          });
          toast().util_toast(value.user!.email.toString());

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Mode_Selection()),
          );
        })
        .onError((error, stackTrace) {
          toast().util_toast(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Page",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screen_size;

              if (constraints.maxWidth < constraints.maxHeight) {
                screen_size = constraints.maxWidth * 0.7;
              } else {
                screen_size = constraints.maxWidth * 0.8;
              }
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: screen_size,
                        width: screen_size,
                        child: Form(
                          key: widget._formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: Email_controller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Your Email",
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 28),
                              TextFormField(
                                controller: Password_controller,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Your Password",
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Password";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          if (widget._formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            // Login is a function created which will deal with user login
                            Login();
                          }
                        },
                        child: loading
                            ? CircularProgressIndicator()
                            : Text(
                                "Login",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineLarge,
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 13),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup_Page(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontSize: 15),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.purple,
                              padding:
                                  EdgeInsets.zero, // ✅ removes unwanted spacing
                              minimumSize: Size(0, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text("OR"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhoneNumberLoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In With Mobile Number",
                          style: TextStyle(fontSize: 15),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple,
                          padding:
                              EdgeInsets.zero, // ✅ removes unwanted spacing
                          minimumSize: Size(0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
