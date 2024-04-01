import 'package:expense_app/firebase_options.dart';
import 'package:expense_app/src/app.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
      ],
      child: const App(),
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
