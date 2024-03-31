import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/mainscreen'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);
              });
            },
            icon: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          )
        ],
      ),
    );
  }
}
