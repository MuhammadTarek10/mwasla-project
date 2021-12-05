import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mwasla_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'package:mwasla_app/ui/main/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onDispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            inputField(emailController: _emailController, hintText: "Email Address"),
            inputField(emailController: _passwordController, hintText: "Password"),
            ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    authenticateUser(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => Text("Incorrect Details"),
                    );
                  }
                }),
            TextButton(
                onPressed: ()=> Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => RegisterPage())),
                child: Text("Don't have an Account? Sign Up!"))
          ],
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text)).user!;
    if(user!=null){
      usersRef.child(user.uid).once().then((DataSnapshot snap){
        if(snap.value!=null){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
        }
        else{
          _auth.signOut();
          SnackBar snackBar = SnackBar(content: Text("Wrong Credentials"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}

class inputField extends StatelessWidget {
  const inputField({Key? key, required this.emailController, required this.hintText})
      : super(key: key);

  final TextEditingController emailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}

