import 'package:expense_app/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;
  late BuildContext _context;

  bool _isDarkMode = false;

  ThemeProvider(BuildContext context) {
    _context = context;
    _themeData = lightTheme(context);
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;


  void toggleTheme(BuildContext context) {
    _themeData = _themeData == lightTheme(_context)
        ? darkTheme(_context)
        : lightTheme(_context);
    _isDarkMode = _themeData == darkTheme(_context);
    notifyListeners();
  }
}
