// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxy/utils/routes.dart';


// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
          if( _formKey.currentState!.validate()){
           setState(() {
                              changeButton = true;
                            });
                            await Future.delayed(Duration(seconds: 1));
                            await Navigator.pushNamed(context, MyRoutes.homeRoute);
                            setState(() {
                              changeButton = false;
                            });
          }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/secure.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if( value!.isEmpty ){
                            return "username cannot be empty";
                          }
                          return null;
                          
                        },
                        onChanged: (value){
                          name = value;
                          setState(() {
                            
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if( value!.isEmpty ){
                            return "password cannot be empty";
                          }

                          else if(value.length<6){
                            return "password must have atleast six characters babu";
                          }
                          return null;
                          
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
          
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                            //
                            //splashColor: Colors.white,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changeButton ? Icon(Icons.done, color: Colors.white,) :Text("login", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                             duration: Duration(seconds: 1,),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}