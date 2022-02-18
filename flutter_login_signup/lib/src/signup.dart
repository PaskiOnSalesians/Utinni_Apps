import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffcc00cc), Color(0xff660066)])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xffcc00cc),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        text: 'DragonApp',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffcc00cc)),
      ),
    );
  }

  Widget _logo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('img/logoHP.png'),
            width: 100,
            height: 100,
          ), // Image.asset('img/logoHP.png')
          Text(
            'Horrocrux',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Email"),
        _entryField("Password", isPassword: true),
        _entryField("Confirm Password", isPassword: true),
      ],
    );
  }

  bool _agree = false;

  Widget _condiciones() {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Checkbox(
              value: _agree,
              onChanged: (isChecked) {
                setState(() {
                  _agree = isChecked!;
                });
              }),
          Text("I Agree to the "),
          InkWell(
            onTap: () {},
            child: Text(
              "Terms of services",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(" & "),
          InkWell(
            onTap: () {},
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }

  // Widget _logo() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 55),
  //     child: Row(
  //       children: <Widget>[
  //         Image(
  //           image: AssetImage('img/logoHP.png'),
  //           width: 100,
  //           height: 100,
  //         ), // Image.asset('img/logoHP.png')
  //         Text(
  //           'Horrocrux',
  //           style: TextStyle(fontSize: 30),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    //_title(),
                    _logo(),
                    SizedBox(
                      height: 15,
                    ),
                    _emailPasswordWidget(),

                    SizedBox(height: 20),
                    // _newsletter(),

                    SizedBox(height: 10),
                    _condiciones(),

                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: 0),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
