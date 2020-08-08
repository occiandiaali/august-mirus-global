import 'package:flutter/material.dart';
import 'package:mirusglobal/tools/app_tools.dart';
import 'package:mirusglobal/userScreens/loginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context; // for prog dialog

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Sign Up'),
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
                textHint: 'your name',
                textType: TextInputType.text,
                textIcon: Icons.person,
                controller: fullName),
            SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'you@emailaddress.com',
                textType: TextInputType.emailAddress,
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
            SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: 'enter password again',
                textIcon: Icons.lock,
                controller: rePassword),
            SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'your phone number',
                textType: TextInputType.phone,
                textIcon: Icons.phone,
                controller: phoneNumber),
            submitButton(
                btnText: 'Sign Up',
                onBtnClicked: verifyDetails,
                btnPadding: 20,
                btnColor: Theme.of(context).primaryColor),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Already registered? Sign In',
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

  verifyDetails() {
    if (fullName.text == '') {
      showSnackBar('Please enter your name', scaffoldKey);
      return;
    }

    if (phoneNumber.text == '') {
      showSnackBar('Please enter your phone number', scaffoldKey);
      return;
    }

    if (email.text == '') {
      showSnackBar('Please enter a proper email address', scaffoldKey);
      return;
    }

    if (password.text == '') {
      showSnackBar('Password is required', scaffoldKey);
      return;
    }

    if (rePassword.text == '') {
      showSnackBar('Password is required again', scaffoldKey);
      return;
    }

    if (password.text != rePassword.text) {
      showSnackBar('Password mismatch!', scaffoldKey);
      return;
    }

    displayProgressDialog(context);
  } // verify login
} // end
