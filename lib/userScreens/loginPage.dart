import 'package:flutter/material.dart';
import 'package:mirusglobal/tools/app_tools.dart';
import 'package:mirusglobal/userScreens/signUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context; // for prog dialog

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'you@emailaddress.com',
                textIcon: Icons.email,
                controller: email),
            SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: 'your password',
                textIcon: Icons.lock,
                controller: password),
            submitButton(
                btnText: 'Sign In',
                onBtnClicked: verifyLogin,
                btnPadding: 20,
                btnColor: Theme.of(context).primaryColor),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                'New user? Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyLogin() {
    if (email.text == '') {
      showSnackBar('Please enter a proper email address', scaffoldKey);
      return;
    }

    if (password.text == '') {
      showSnackBar('Password is required', scaffoldKey);
      return;
    }

    displayProgressDialog(context);
  } // verify login
} // end
