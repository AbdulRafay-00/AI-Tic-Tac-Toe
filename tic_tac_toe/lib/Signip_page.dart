import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import"package:flutter/material.dart";
import "package:flutter/rendering.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:tic_tac_toe/login_page.dart";
import "package:tic_tac_toe/utils/toast_utilities.dart";
import 'firebase_options.dart';

// void main()async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(Signup_Page());
// }
class Signup_Page extends StatefulWidget {
  Signup_Page({super.key});
  final _formkey=GlobalKey<FormState>();
// FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  bool loading= false;
  final Email_controller=TextEditingController();
  final Password_controller=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;

  void dispose(){
    super.dispose();
    Email_controller.dispose();
    Password_controller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text("Signup Page",style: TextTheme.of(context).headlineLarge,),

          ),
          body: LayoutBuilder(builder:(context,Constraint){
            double screen_size;
            double screen_height;
            if(Constraint.maxWidth < Constraint.maxHeight){
              screen_size= Constraint.maxWidth* 0.7;
            }else{

              screen_size= Constraint.maxWidth* 0.8;

            }



            return Center(
                child : SizedBox(
                  height: screen_size,
                  width: screen_size,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: ,
                    children: [

                      Form(
                          key: widget._formkey,
                          child:Column(
                            children: [

                              TextFormField(
                                controller: Email_controller,
                                keyboardType: TextInputType.emailAddress,

                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter Your Email",
                                    prefixIcon: Icon(Icons.email_outlined)
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter Email";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20),
                              TextFormField(
                                controller: Password_controller,

                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter Your Password",
                                    prefixIcon: Icon(Icons.password_outlined)
                                ),
                                validator: (value){
                                  if(value!.isEmpty || value == null){
                                    return "Enter Password";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )
                      ),


                      SizedBox(height: 20),
                      ElevatedButton(onPressed: (){
                        if(widget._formkey.currentState!.validate()){
                          setState(() {
                            loading = true;
                          });
                        _auth.createUserWithEmailAndPassword(
                            email: Email_controller.text.toString(),
                            password:Password_controller.text.toString(),
                        ).then((value){
                          setState(() {
                            loading = false;
                          });
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login_Page()));
                        }).onError((error, stackTrace){
                          debugPrint(error.toString());
                          toast().util_toast(error.toString());
                          setState(() {
                            loading = false;
                          });
                        });
                        }
                      },
                        child:loading ? CircularProgressIndicator() : Text("Sign up",style: TextTheme.of(context).headlineLarge,),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent
                        ),

                      )
                    ],
                  ),
                )
            );

          })
      ),
    );
  }
}





