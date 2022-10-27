import 'dart:ui';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn(
      {super.key,
      this.googleSignInLogic,
      this.appleSignInLogic,
      this.facebookSignInLogic,
      this.emailAuthHandler,
      this.renderAll = true,
      this.usernameInputDecoration});

  //Work on this
  final bool renderAll;
  final Function? googleSignInLogic;
  final Function? appleSignInLogic;
  final Function? facebookSignInLogic;
  final Function(String email, String password)? emailAuthHandler;
  final InputDecoration? usernameInputDecoration;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<Widget> constructWidgets() {
    List<Widget> res = [];
    if (widget.emailAuthHandler != null) {
      res.add(EmailAuth(
        emailAuthHandler: widget.emailAuthHandler!,
        usernameInputDecoration: widget.usernameInputDecoration,
      ));
    } else {
      res.add(EmailAuth(emailAuthHandler: ((p0, p1) {})));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: constructWidgets(),
    );
  }
}

class EmailAuth extends StatefulWidget {
  const EmailAuth({
    super.key,
    required this.emailAuthHandler,
    this.loginPrompt = "Login",
    this.usernameInputDecoration,
    this.passwordInputDecoration,
  });

  final String loginPrompt;
  final Function(String, String) emailAuthHandler;
  final InputDecoration? usernameInputDecoration;
  final InputDecoration? passwordInputDecoration;
  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  String? username;

  String? password;

  bool rememberMe = false;
  bool obscurePassword = true;
  //username related
  InputDecoration? usernameDecoration() {
    if (widget.usernameInputDecoration == null) {
      return defaultUsernameDecoration();
    } else {
      return widget.usernameInputDecoration;
    }
  }

  TextField usernameTextField() {
    return TextField(
      decoration: usernameDecoration(),
      onChanged: ((value) {
        setState(() {
          username = value;
        });
      }),
    );
  }

  InputDecoration defaultUsernameDecoration() {
    return const InputDecoration(
      icon: Icon(
        Icons.person,
      ),
      label: Text(
        "Username",
      ),
      hintText: "Alan Turing",
    );
  }

  InputDecoration defaultPasswordDecoration() {
    return InputDecoration(
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
        icon: const Icon(
          Icons.remove_red_eye,
        ),
      ),
      icon: const Icon(
        Icons.password,
      ),
      label: const Text(
        "Password",
      ),
    );
  }

  //password related
  Widget passwordField() {
    return TextField(
      obscureText: obscurePassword,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      decoration: passwordDecoration(),
    );
  }

  InputDecoration? passwordDecoration() {
    if (widget.passwordInputDecoration == null) {
      return defaultPasswordDecoration();
    } else {
      return widget.passwordInputDecoration;
    }
  }

  Widget emailAuthWidget(Widget fieldType) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: fieldType);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 30),
            ),
          ),
          //username field
          emailAuthWidget(usernameTextField()), //password field
          emailAuthWidget(passwordField()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (username == null || password == null) return;
                      widget.emailAuthHandler(username!, password!);
                    },
                    style: ButtonStyle(
                        minimumSize:
                            const MaterialStatePropertyAll(Size(20, 50)),
                        shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                    child: Text(widget.loginPrompt),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                      value: rememberMe,
                      onChanged: ((value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      })),
                  const Text("Remember me")
                ],
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text("Forgot password"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.android_outlined),
                    label: Text("Sign in with google"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                    label: Text("Sign in with Facebook"),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? "),
              TextButton(
                onPressed: () {},
                child: Text("Create a new one"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
