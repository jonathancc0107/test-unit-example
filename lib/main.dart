import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_unit/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Unit Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Unit Example'),
        ),
        body: Center(
          child: Login(),
        ),
      ),
    );
  }
}
