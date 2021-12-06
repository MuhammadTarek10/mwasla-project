import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'package:mwasla_app/ui/main/register_page.dart';
import 'package:mwasla_app/ui/widgets/login_and_register_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mwasla_app/ui/widgets/social_authentication_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth auth = FirebaseAuth.instance;

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
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.2,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              InputField(
                  emailController: _emailController, hintText: "Email Address"),
              InputField(
                  emailController: _passwordController, hintText: "Password"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonsToClick(
                      formkey: _formKey,
                      text: "Sign In",
                      pageContext: context,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      auth: auth,
                      isRegister: false),
                  GoogleSignInButton(googleSignIn: googleSignIn),
                ],
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: Text("Don't have an Account? Sign Up!"))
            ],
          ),
        ),
      ),
    );
  }
}
