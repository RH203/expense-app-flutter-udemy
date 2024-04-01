import 'package:expense_app/src/features/auth_screen/models/validator.dart';
import 'package:expense_app/src/features/main_screen/views/main_screen.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:expense_app/src/utils/widget/custom_buttons/custom_buttons.dart';
import 'package:expense_app/src/utils/widget/text_field_form/text_field_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _checkSignIn = false;
  bool _valueCheckBox = false;
  final log = Logger("SIGN IN");

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } catch (e) {
      log.warning("Oh nooo", e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/onboardingscreen');
          },
          icon: const Icon(FontAwesome.arrow_left_solid),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme(context);
            },
            icon: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).colorScheme.tertiary,
                size: 200,
              );
            }
            return _bodySignIn(context);
          } else if (snapshot.hasData == null) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).colorScheme.tertiary,
                size: 200,
              );
            }
            return const MainScreen();
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).colorScheme.tertiary,
                size: 200,
              );
            }
            return _bodySignIn(context);
          }
        },
      ),
    );
  }

  Container _bodySignIn(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //* Sign in Text
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Text(
              "Sign In",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
          ),
          //* Field Text
          _formFieldSignIn(context),
          //* Button
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Column(
              children: [
                CustomButtons(
                  onTap: signIn,
                  text: "Login",
                  fontSize: 20,
                  height: 70,
                  width: 360,
                  padding: const EdgeInsets.all(20),
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet? ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, '/signupscreen'),
                      child: Text(
                        "Create now ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //* Login via gmail, facebook, etc
          SizedBox(
            width: double.infinity,
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onBackground,
                        thickness: 2,
                        height: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "or sign in with",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onBackground,
                        thickness: 2,
                        height: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesome.google_brand,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesome.facebook_brand,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesome.apple_brand,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _formFieldSignIn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFieldForm(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.name,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Please input username";
              }
              if (Validator.emailIsValid(email)) {
                return "Oops. Minimum eight words for username";
              }
              return "";
            },
          ),
          TextFieldForm.password(
            controller: _passwordController,
            hintText: "Password",
            keyboardType: TextInputType.name,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return "Please input password";
              }
              if (Validator.passwordIsValid(password)) {
                return "Oops. Minimum eight words for password";
              }
              return "";
            },
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  fillColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                  value: _valueCheckBox,
                  onChanged: (value) {
                    setState(
                      () {
                        _valueCheckBox = value!;
                      },
                    );
                  },
                ),
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
