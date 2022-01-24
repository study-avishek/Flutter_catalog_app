import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool changeButton = false;
  String name = "";
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    {
      if (_formKey.currentState != null) {
        if (_formKey.currentState!.validate()) {
          setState(() {
            changeButton = true;
          });
          await Future.delayed(Duration(milliseconds: 500));
          await Navigator.pushNamed(context, MyRoutes.homeRoute);
          setState(() {
            changeButton = false;
          });
        }
      }
    }
    ;
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset("assets/images/login.png"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome $name",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.indigo.shade600,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username /Email Address",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "password cannot be empty";
                          }
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "password cannot be empty";
                          }
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      color: Colors.indigo,
                      child: InkWell(
                        splashColor: Colors.purple.shade800,
                        hoverColor: Colors.purple.shade800,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
