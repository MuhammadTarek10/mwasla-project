import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mwasla_app/ui/main/login_page.dart';
import 'package:mwasla_app/ui/widgets/login_and_register_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              ButtonsToClick(
                  formkey: _formKey,
                  text: "Sign Up",
                  pageContext: context,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  auth: auth,
                  isRegister: true),
              TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage())),
                  child: const Text("Already Have an Account! Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
