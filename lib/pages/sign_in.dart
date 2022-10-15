import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn(
      {super.key,
      this.googleSignInLogic,
      this.appleSignInLogic,
      this.facebookSignInLogic,
      this.emailAuthHandler,
      this.renderAll = true});

  //Work on this 
  final bool renderAll;
  final Function? googleSignInLogic;
  final Function? appleSignInLogic;
  final Function? facebookSignInLogic;
  final Function(String email, String password)? emailAuthHandler;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String yp = "";
  String me = "";

  List<Widget> constructWidgets() {
    List<Widget> res = [];
    if (widget.emailAuthHandler != null) {
      res.add(EmailAuth(emailAuthHandler: widget.emailAuthHandler!));
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
  const EmailAuth(
      {super.key, required this.emailAuthHandler, this.loginPrompt = "Login"});

  final String loginPrompt;
  final Function(String, String) emailAuthHandler;
  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  String? username;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //username field
        TextField(
          onChanged: ((value) {
            setState(() {
              username = value;
            });
          }),
        ),
        //password field
        TextField(
          obscureText: true,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        ElevatedButton(
            onPressed: () {
              if (username == null || password == null) return;
              widget.emailAuthHandler(username!, password!);
            },
            child: Text(widget.loginPrompt))
      ],
    );
  }
}
