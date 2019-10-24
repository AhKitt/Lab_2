import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emcontroller = TextEditingController();
  String _email = "";
  final TextEditingController _passcontroller = TextEditingController();
  String _password = "";
  bool _isChecked = false;

  @override
  void initState() {
    //loadpref();
    print('Init: $_email');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        
        onWillPop: _onBackPressAppBar,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: new Container(
            decoration: new BoxDecoration(color: Color.fromRGBO(199, 241, 255, 1)),
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/mylogo.png',
                  scale: 1.5,
                ),
                TextField(
                    controller: _emcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email', icon: Icon(Icons.email))),
                TextField(
                  controller: _passcontroller,
                  decoration: InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 300,
                  height: 50,
                  child: Text('Login', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  color: Color.fromRGBO(0, 186, 247, 1),
                  textColor: Colors.white,
                  elevation: 15,
                  onPressed: _onLogin,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.grey,
                      value: _isChecked,
                      onChanged: (bool value) {
                        //_onChange(value);
                      },
                    ),
                    Text('Remember Me', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register New Account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(130, 130, 130, 1)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Forgot Account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(130, 130, 130, 1)
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _onLogin() {
    //function
  }

  Future<bool> _onBackPressAppBar() async {
    SystemNavigator.pop();
    print('Backpress');
    return Future.value(false);
  }
}
