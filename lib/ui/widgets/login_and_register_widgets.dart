import 'package:flutter/material.dart';
import 'package:mwasla_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'package:mwasla_app/ui/main/login_page.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonsToClick extends StatelessWidget {
  const ButtonsToClick(
      {Key? key,
      required this.formkey,
      required this.text,
      required this.pageContext,
      required this.emailController,
      required this.passwordController,
      required this.auth,
      required this.isRegister})
      : super(key: key);

  final formkey;
  final text;
  final pageContext;
  final auth;
  final emailController;
  final passwordController;
  final isRegister;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 24.0)),
      onPressed: () async {
        if (formkey.currentState!.validate()) {
          isRegister
              ? registerUser(pageContext)
              : authenticateUser(pageContext);
        } else {
          showDialog(
              context: pageContext,
              builder: (pageContext) => Text('Incorrect Details'));
        }
      },
    );
  }

  void registerUser(BuildContext context) async {
    final User user = (await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user!;
    if (user != null) {
      Map userDataMap = {
        "name": "test",
        "emai": emailController.text,
        "phone": "testphone",
        "password": passwordController.text,
      };
      usersRef.child(user.uid).set(userDataMap);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  void authenticateUser(BuildContext context) async {
    final User user = (await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user!;
    if (user != null) {
      usersRef.child(user.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
          auth.signOut();
          SnackBar snackBar = SnackBar(content: Text("Wrong Credentials"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.hintText, required this.emailController})
      : super(key: key);

  final hintText;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
