import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'signup_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

bool _obscureText = true;

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 70,
              left: 185,
              child: Image.asset(
                'assets/images/Center.png',
                scale: 1,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/TopLeft.png',
                scale: 0.92,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/TopRight1.png',
                scale: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Create an \nAccount",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(70, 183, 191, 1),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // validator: (input) {
                          //   if (input.isEmpty) {
                          //     return 'Provide an email';
                          //   }
                          // },
                          //onSaved: (input) => email = input.trim(),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Name',
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.black12,
                            ),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // validator: (input) {
                          //   if (input.isEmpty) {
                          //     return 'Provide an email';
                          //   }
                          // },
                          //onSaved: (input) => email = input.trim(),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'your@email.com',
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.black12,
                            ),
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: TextFormField(
                          obscureText: _obscureText,
                          keyboardType: TextInputType.text,
                          // validator: (input) {
                          //   if (input.isEmpty) {
                          //     return 'Provide an email';
                          //   }
                          // },
                          //onSaved: (input) => password = input.trim(),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.black12,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              color: Colors.grey,
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * .05,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(70, 183, 191, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 183, 191, 1),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: FlatButton(
                              onPressed: () {
                                model.nagivateToHome();
                              },
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              model.nagivateToLogin();
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
