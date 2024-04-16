import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motor_app/src/screens/Signin/signin.dart';
import 'package:motor_app/src/screens/Home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? currentUser = FirebaseAuth.instance.currentUser;

  Widget initialRoute =
      currentUser != null ? HomePage(user: currentUser) : SignInScreen();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final Widget initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Varela',
        useMaterial3: true,
      ),
      home: initialRoute,
    );
  }
}
