import 'package:flutter/material.dart';
import 'loginpage.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  RegistrasiPageState createState() => RegistrasiPageState();
}

class RegistrasiPageState extends State<RegistrasiPage> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cpasswordController = new TextEditingController();
  final formkey = new GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   updateListView();
  // }

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
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: namaController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                validator: (nama) {
                  return nama.isEmpty ? "*Mohon diisi" : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                validator: (email) {
                  return email.isEmpty ? "*Mohon diisi" : null;
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
              padding: const EdgeInsets.all(10),
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
              padding: EdgeInsets.all(10),
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
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: cpasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (cpassword) {
                  return cpassword.isEmpty ? "*Mohon diisi" : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.black,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 10,
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Registrasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
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
                    "Back",
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
