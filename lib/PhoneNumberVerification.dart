import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Game_page.dart';
import 'package:tic_tac_flutter/toast/utilities_toast.dart';

class VerificatioOfUser extends StatefulWidget {
  String verification_id;
  VerificatioOfUser({required this.verification_id});

  @override
  State<VerificatioOfUser> createState() => _VerificatioOfUserState();
}

class _VerificatioOfUserState extends State<VerificatioOfUser> {
  final NumberVerificationController = TextEditingController();
  final _Mobilekey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify Your Account",
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
                        controller: NumberVerificationController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your Verification Code",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter verification code";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () async {
                      if (_Mobilekey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });

                        final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verification_id,
                          smsCode: NumberVerificationController.text,
                        );

                        try {
                          await _auth.signInWithCredential(credential);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Game_page(),
                            ),
                          );
                        } catch (e) {
                          toast().util_toast(e.toString());
                        }

                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    child: loading
                        ? CircularProgressIndicator()
                        : Text(
                            "Verify",
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
