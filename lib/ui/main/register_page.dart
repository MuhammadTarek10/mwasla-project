import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mwasla_app/main.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'package:mwasla_app/ui/main/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

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
        child: Column(
          children: [
            inputField(emailController: _emailController, hintText: "Email Address"),
            inputField(emailController: _passwordController, hintText: "Password"),
            ElevatedButton(
              child: Text("Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 24.0)),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  registerUser(context);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => Text('Incorrect Details'));
                }
              },
            ),
            TextButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage())),
                child: Text("Already Have an Account! Sign in"))
          ],
        ),
      ),
    );
  }

  void registerUser(BuildContext context) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user!;
    if (user != null) {
      Map userDataMap = {
        "name": "test",
        "emai": _emailController.text,
        "phone": "testphone",
        "password": _passwordController.text,
      };
      usersRef.child(user.uid).set(userDataMap);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
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
