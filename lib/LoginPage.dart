import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    )
);

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
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
                  Container(
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
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "example@mail.com",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),

                        ),


                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "**********",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(

                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
                    ),

                  ),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
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

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}