import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:erg_app/StockPage.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  @override 
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> { 
  
  bool _isLoading = false; 

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/head_img.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child:  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png')
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 100,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 80,
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text ("To proceed to your dashabord", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
    
                  // inputs
                    textSection(),
                  // end of inputs

                  SizedBox(height: 30,),
                 
                  //  button
                  buttonSection(),
                  // end of button

                  SizedBox(height: 20,),

                  //  forget password
                  Container(
                    padding: EdgeInsets.only(top: 1, left: 190.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // end of forget password

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// text section
Container textSection(){

 return  Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(143, 148, 251, .2),
              blurRadius: 20.0,
              offset: Offset(0, 10)
          )
        ]
    ),
    
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[100]))
          ),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "example@mail.com",
                hintStyle: TextStyle(color: Colors.grey[400])
            ),
          ),

        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey[400])
            ),
          ),
        )
      ],
    ),
  );
}
// end of textsection

final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

Container buttonSection(){
  return Container(
    width: MediaQuery.of(context).size.width,

    child: Center(
      child: RaisedButton(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          color: Colors.green,
          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
          // onPressed: () {
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => StockPage()));
          // },

           onPressed:emailController.text == "" || passwordController.text == "" ? null : () {
            setState(() {
              _isLoading = true;
            });
            signIn(emailController.text, passwordController.text);
          },
        elevation: 0.0,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );
}

// signin
  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var jsonResponse = null;
    var response = await http.post(
      "http://localhost:3000/users", 
      body: data,
      headers: {
          'Content-Type': 'application/json',
      },
    );
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => StockPage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
// end of signing
}

