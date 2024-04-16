import 'package:flutter/material.dart';
import 'package:motor_app/src/screens/Policy/policy.dart';
import 'package:motor_app/src/utils/appcolors.dart';
import 'package:motor_app/src/utils/authentication.dart';
import 'package:motor_app/src/utils/textstyle.dart';
import 'package:motor_app/src/widgets/google_signin_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: firebaseNavy,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/e.jpg',
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return GoogleSignInButton();
                      }
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          firebaseOrange,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                      height: 0), // Add some space between button and text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By signing in, You accept our ',
                        style: DesignText.title,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigate to privacy policy page here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyPage()),
                          );
                        },
                        child: Text(' privacy policy',
                            style: DesignText.linkTitle),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
