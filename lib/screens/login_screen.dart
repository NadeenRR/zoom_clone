import 'package:flutter/material.dart';

import '../resources/auth_mehods.dart';
import '../widgets/custome_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Start or join a meeting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Image.asset('assets/images/onboarding.jpg'),
        ),
        CustomeButton(
          text: 'Google Sign In',
          onPressed: () async {
            bool res = await _authMethods.signInWithGoogle(context);
            if (res) {
              debugPrint('login');
            }
          },
        )
      ]),
    );
  }
}
