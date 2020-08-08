import 'package:flutter/material.dart';
import 'package:mirusglobal/tools/progressDialog.dart';

Widget appTextField(
    {IconData textIcon,
    String textHint,
    bool isPassword,
    TextInputType textType,
    double sidePadding,
    TextEditingController controller}) {
  (sidePadding == null) ? sidePadding = 0.0 : sidePadding = sidePadding;
  (textHint == null) ? textHint = '' : textHint = textHint;
  textType == null ? textType = TextInputType.text : textType = textType;
  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? Container() : Icon(textIcon),
        ),
      ),
    ),
  );
} // input fields widget

Widget submitButton(
    {String btnText,
    double btnPadding,
    Color btnColor,
    VoidCallback onBtnClicked}) {
  (btnText == null) ? btnText = 'App Button' : btnText = btnText;
  (btnPadding == null) ? btnPadding = 0.0 : btnPadding = btnPadding;
  (btnColor == null) ? btnColor = Colors.deepPurple : btnColor = btnColor;

  return Padding(
    padding: EdgeInsets.all(btnPadding),
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      onPressed: onBtnClicked,
      child: Container(
        height: 45.0,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: btnColor, fontSize: 18.0),
          ),
        ),
      ),
    ),
  );
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.red[700],
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      )));
} // show snack

displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return ProgressDialog();
      }));
} // display PDialog

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
} // close PDialog
