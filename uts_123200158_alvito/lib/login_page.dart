import 'package:flutter/material.dart';
 import 'home_page.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  _image(),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _username(),
                  _password(),
                  _loginButton(context),
              ],
            ),
          ),
          ),
        ),
    );
  }
  Widget _image(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 35),
        width: 250.0,
        child: Image.asset('images/login.png',)

    );
  }

  Widget _username(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 300.0,
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.blue : Colors.green)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.blue : Colors.red)
          ),
        ),
      ),
    );
  }

  Widget _password(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 300.0,
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          password = value;
        },
          onEditingComplete: () {
            _login(context);
          },
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                    color: (isLoginSuccess) ? Colors.blue : Colors.green)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                    color: (isLoginSuccess) ? Colors.blue : Colors.red)
            )
        ),
      ),
    );
  }
  Widget _loginButton(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 300.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
          primary: (isLoginSuccess) ? Colors.blue : Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          _login(context);
        },
        child: const Text(
          'Sign in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    String text = "";
    if(username ==  "123200158" && password == "alvitoaryo"){
      setState(() {
        text = "Login Berhasil";
        isLoginSuccess = true;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomePage(username: username);
      }));
    }
    else {
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
      });
    }

    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}