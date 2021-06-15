import 'package:flutter/material.dart';
import 'package:project_uas_kasir/pages/registrasipage.dart';
import 'package:project_uas_kasir/service/sign_in.dart';
import 'second_screen.dart';
import 'start_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 150),
            Container(
              child: Image(
                image: NetworkImage(
                    'https://scontent.fsub1-2.fna.fbcdn.net/v/t1.6435-9/191256953_2065773930229114_5298015830780953105_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=730e14&_nc_eui2=AeF_yfcwkcKKhkCxyaEPtm9UrTA3MOwWv1WtMDcw7Ba_Vfb68Oo1Zge62fOymfp07RkY-VEZU1Seuwx3i7vGnl3y&_nc_ohc=EBRu06R4ctQAX-FKQ65&_nc_ht=scontent.fsub1-2.fna&oh=1c245b53e490c1265035995a61ae1dde&oe=60CAB3E8'),
              ),
              height: 100,
            ),
            SizedBox(height: 110),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: emailController,
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
                  labelText: 'Email',
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
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: RaisedButton(
                onPressed: () {
                  signInEmail(emailController.text, passwordController.text)
                      .then((result) {
                    if (result != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SecondScreen();
                      }));
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
                    "Login",
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
                      MaterialPageRoute(builder: (_) => StartScreen());
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
                    "Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
