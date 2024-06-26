import 'package:expense_app/src/features/auth_screen/views/check_page.dart';
import 'package:expense_app/src/features/auth_screen/views/sign_in_screen.dart';
import 'package:expense_app/src/features/auth_screen/views/sign_up_screen.dart';
import 'package:expense_app/src/features/input_screen/views/input_screen.dart';
import 'package:expense_app/src/features/main_screen/views/main_screen.dart';
import 'package:expense_app/src/features/on_boarding/views/on_boarding_scren.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense APP",
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        //? Main screen
        '/mainscreen': (context) => const MainScreen(),
        //? Onboarding screen
        '/onboardingscreen': (context) => const OnBoardingScreen(),
        //? Input screen
        '/inputscreen': (context) => const InputScreen(),
        //? Auth screen
        '/signinscreen': (context) => const SignInScreen(),
        '/signupscreen': (context) => const SignUpScreen(),
        '/checkpagescreen': (context) =>  CheckPage(),
      },
      home: const OnBoardingScreen(),
    );
  }
}
