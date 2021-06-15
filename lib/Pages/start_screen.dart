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
                padding: const EdgeInsets.only(top: 60, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // RotatedBox(
                  //   quarterTurns: -1,
                  //   child: Text(
                  //     'Welcome To',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 38,
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //   ),
                  // ),
                  Image(
                    image: NetworkImage(
                        'https://scontent.fsub1-2.fna.fbcdn.net/v/t1.6435-9/196306669_2065779846895189_3694894279922058653_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=730e14&_nc_eui2=AeEKkmnTmtxv06k8c2IHV_yoGhBSsoyJCbwaEFKyjIkJvFmRKfrUBqU7lxqPN6_BouvbwKvv-q_iGTpGD9YhCRrM&_nc_ohc=YGkhj9hiFxEAX8QCnBA&_nc_ht=scontent.fsub1-2.fna&oh=5be1c9ea1352adeb29fb69f65ca5f0ec&oe=60CAD386'),
                    height: 200,
                  ),
                ])),
            Container(
              padding: const EdgeInsets.only(left: 10.0, bottom: 50),
              child: Container(
                //color: Colors.green,
                height: 100,
                width: 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'Kasir Morfeen Official',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 200),
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
