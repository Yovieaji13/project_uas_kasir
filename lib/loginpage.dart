import 'package:flutter/material.dart';
import 'package:project_uas_kasir/registrasipage.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Image(
                image: NetworkImage(
                    'https://scontent-cgk1-1.xx.fbcdn.net/v/t1.6435-9/104438863_3351848721706094_7197417179988458720_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=JiQNBS1tDZkAX8LmlwX&_nc_ht=scontent-cgk1-1.xx&oh=9b606f9f56cf463a837005572baf8a31&oe=60D25DD2'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                validator: (username) {
                  return username.isEmpty ? "*Mohon diisi" : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (password) {
                  return password.isEmpty ? "*Mohon diisi" : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  labelText: 'Pasword',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.white,
              child: Text('Forgot Password', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: RaisedButton(
                onPressed: () {

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.black,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 10,
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account?',
                      style: TextStyle(color: Colors.white)),
                  FlatButton(
                    textColor: Colors.white,
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      MaterialPageRoute route =
                          MaterialPageRoute(builder: (_) => RegistrasiPage());
                      Navigator.push(context, route);
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
