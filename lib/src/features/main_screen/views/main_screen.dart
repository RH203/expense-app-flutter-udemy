import 'package:expense_app/src/utils/helpers_variabel/helpers_variabel.dart';
import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () =>
              Navigator.popAndPushNamed(context, '/onboardingscreen'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
        title: Column(
          children: [
            Text(
              HelpersVariabel.welcomeTitleOne,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              "Name user",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
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
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () => Navigator.popAndPushNamed(context, '/inputscreen'),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onTertiary,
          size: 35,
        ),
      ),
    );
  }
}
