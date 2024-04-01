import 'package:expense_app/src/features/auth_screen/models/validator.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:expense_app/src/utils/widget/custom_buttons/custom_buttons.dart';
import 'package:expense_app/src/utils/widget/text_field_form/text_field_form.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
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
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
                    onTap: () =>
                        Navigator.popAndPushNamed(context, '/mainscreen'),
                    text: "Create",
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
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, '/signinscreen'),
                        child: Text(
                          "Sign in now ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                        "or sign up with",
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
      ),
    );
  }

  SizedBox _formFieldSignIn(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Flexible(
                child: TextFieldForm(
                  controller: _firstNameController,
                  hintText: "First name",
                  keyboardType: TextInputType.name,
                  validator: (firstname) {
                    if (firstname == null || firstname.isEmpty) {
                      return "Please input firstname";
                    }
                    if (Validator.usernameIsValid(firstname)) {
                      return "Oops. Minimum eight words for firstname";
                    }
                    return "";
                  },
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: TextFieldForm(
                  controller: _lastNameController,
                  hintText: "Last name",
                  keyboardType: TextInputType.name,
                  validator: (lastname) {
                    if (lastname == null || lastname.isEmpty) {
                      return "Please input lastname";
                    }
                    if (Validator.usernameIsValid(lastname)) {
                      return "Oops. Minimum eight words for lastname";
                    }
                    return "";
                  },
                ),
              ),
            ],
          ),
          TextFieldForm(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.name,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Please input email";
              }
              if (Validator.emailIsValid(email)) {
                return "Oops. Minimum eight words for email";
              }
              return "";
            },
          ),
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
        ],
      ),
    );
  }
}
