import 'package:expense_app/src/features/auth_screen/views/sign_in_screen.dart';
import 'package:expense_app/src/features/main_screen/views/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CheckPage extends StatelessWidget {
  CheckPage({super.key});
  final log = Logger("SIGN IN");

  @override
  Widget build(BuildContext context) {
    log.info("CheckPage run");
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            log.info(snapshot.hasData);
            log.info(snapshot.hasError);
            return const MainScreen();
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
