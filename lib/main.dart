import 'package:expense_app/src/app.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
      ],
      child: const App(),
    ),
  );
}
