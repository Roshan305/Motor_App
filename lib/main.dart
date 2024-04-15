import 'package:flutter/material.dart';
import 'package:motor_app/src/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Varela',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
