import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_unit/firebase/auth.dart';
import 'package:test_unit/screens/main_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Builder(builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Login Firebase',
                        style: new TextStyle(
                          fontSize: 35.0,
                          color: Colors.blue,
                        )),
                  ),
                ),
                TextFormField(
                  key: const ValueKey("email"),
                  textAlign: TextAlign.left,
                  decoration:
                      const InputDecoration(hintText: "Correo electrónico"),
                  controller: _emailController,
                ),
                TextFormField(
                  key: const ValueKey("password"),
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(hintText: "Contraseña"),
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  key: const ValueKey("signIn"),
                  onPressed: () async {
                    final String retVal = await Auth(auth: _auth).signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (retVal == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: const Text("Iniciar Sesión"),
                  color: Colors.cyan,
                ),
                FlatButton(
                  key: const ValueKey("createAccount"),
                  onPressed: () async {
                    final String retVal = await Auth(auth: _auth).createAccount(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (retVal == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: const Text("Crear cuenta"),
                ),
                Text(_errorMessage),
              ],
            );
          }),
        ),
      ),
    );
  }
}
