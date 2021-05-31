import 'package:flutter/material.dart';
import 'package:project_uas_kasir/service/sign_in.dart';
import 'first_screen.dart';
import 'loginpage.dart';

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
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
              // child: Image(
              //   image: NetworkImage(
              //       'https://scontent-cgk1-1.xx.fbcdn.net/v/t1.6435-9/104438863_3351848721706094_7197417179988458720_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=JiQNBS1tDZkAX8LmlwX&_nc_ht=scontent-cgk1-1.xx&oh=9b606f9f56cf463a837005572baf8a31&oe=60D25DD2'),
              // ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Welcome at Kasir Morfeen Official',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: RaisedButton(
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen();
                          },
                        ),
                      );
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.black,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 10,
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Login With Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: RaisedButton(
                onPressed: () {
                  MaterialPageRoute route =
                          MaterialPageRoute(builder: (_) => LoginPage());
                      Navigator.push(context, route);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.black,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 10,
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Login With Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
