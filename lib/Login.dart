
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:erg_app/Anchors.dart';
import 'package:erg_app/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isLoading = false;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScaffoldState scaffoldState;

  // _showMsg(msg) {
  //   //

  //   final snackBar = SnackBar(
  //     content: Text(msg),
  //     action: SnackBarAction(
  //       label: 'Close',
  //       onPressed: () {
  //         Text('Something went wrong');
  //       },
  //     ),
  //   );
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }


  _showMsg() {
    final snackBar =
        SnackBar(
          content: Text('Invalid Username or Password', style: (TextStyle(fontSize: 18)),),
          backgroundColor: Colors.amber[900],
        );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.4, 0.9],
            colors: [
              Color(0XFF4CAF50),
              Color(0xFF388E3C),
              Color(0xFF075009),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            ///////////  background///////////
            SizedBox(height: 30),
            new Container(
                width: 100.00,
                height: 100.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('assets/images/icon.png'),
                    fit: BoxFit.contain,
                  ),
                )),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 100,
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Welcome to ERGAgro",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        // child: form(key: _formKey),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /////////////  Email//////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),

                            /////////////// password////////////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            /////////////  LogIn Botton///////////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 10),
                                  child: Text(
                                    _isLoading ? 'Loging...' : 'Login',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Colors.green,
                                disabledColor: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                                onPressed: _isLoading ? null : _login,
                              ),
                              
                            ),
                          ],
                        ),
                      ),
                    ),

                    ////////////   new account///////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => LogIn()));
                        },
                        child: Text(
                          'Forgot Your Password?',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'userName': mailController.text.trim(),
      'password': passwordController.text.trim()
    };

    var res = await CallApi().postData(null,
        'Login?userName=${mailController.text}&password=${passwordController.text}');
    var body = json.decode(res.body);
    if (body['Success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', body['token']);
      // localStorage.setString('customer', json.encode(body['customer']));
      localStorage.setString('loginRes', json.encode(body));

      print(localStorage.getString('loginRes'));

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => AnchorsPage()));
    } else {
      _showMsg();
    }

    setState(() {
      _isLoading = false;
    });
  }
}


class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Username can't be empty";
    }
    return null;
  }
}
 
class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}