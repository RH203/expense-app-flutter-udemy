import 'package:expense_app/src/features/auth_screen/models/validator.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:expense_app/src/utils/widget/custom_buttons/custom_buttons.dart';
import 'package:expense_app/src/utils/widget/text_field_form/text_field_form.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _valueCheckBox = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
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
      body: Container(
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
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.center,
              ),
            ),
            //* Field Text
            _formFieldSignIn(context),
            //* Login via gmail, facebook, etc
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Column(
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
            //* Button
            SizedBox(
              width: double.infinity,
              height: 120,
              child: Column(
                children: [
                  CustomButtons(
                    onTap: () =>
                        Navigator.popAndPushNamed(context, '/mainscreen'),
                    text: "Login",
                    fontSize: 20,
                    height: 70,
                    width: 360,
                    padding: const EdgeInsets.all(20),
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _formFieldSignIn(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFieldForm(
            controller: _usernameController,
            hintText: "Username",
            keyboardType: TextInputType.name,
            validator: (username) {
              if (username == null || username.isEmpty) {
                return "Please input username";
              }
              if (Validator.usernameIsValid(username)) {
                return "Oops. Minimum eight words for username";
              }
              return "";
            },
          ),
          TextFieldForm(
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
