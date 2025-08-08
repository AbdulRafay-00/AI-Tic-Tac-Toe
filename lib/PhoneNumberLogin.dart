import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:tic_tac_flutter/PhoneNumberVerification.dart";
import "package:tic_tac_flutter/toast/utilities_toast.dart";
import 'package:tic_tac_flutter/Splash_Screen.dart';
import 'firebase_options.dart';

class PhoneNumberLoginScreen extends StatefulWidget {
  PhoneNumberLoginScreen({super.key});
  @override
  State<PhoneNumberLoginScreen> createState() => _PhoneNumberLoginScreenState();
}

class _PhoneNumberLoginScreenState extends State<PhoneNumberLoginScreen> {
  final MobilePhoneController = TextEditingController();
  final _Mobilekey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Phone Verification Details
  void Login() {
    _auth.verifyPhoneNumber(
      phoneNumber: MobilePhoneController.text,
      verificationCompleted: (_) {
        setState(() {
          loading = false;
        });
      },
      verificationFailed: (error) {
        toast().util_toast(error.toString());
        setState(() {
          loading = false;
        });
      },
      codeSent: (String verification, int? token) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerificatioOfUser(verification_id: verification),
          ),
        );
        setState(() {
          loading = false;
        });
      },

      codeAutoRetrievalTimeout: (error) {
        toast().util_toast(error.toString());
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create A New Account",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Form(
                      key: _Mobilekey,
                      child: TextFormField(
                        controller: MobilePhoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your Mobile Mumber",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Phone Number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      if (_Mobilekey.currentState!.validate()) {
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
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
