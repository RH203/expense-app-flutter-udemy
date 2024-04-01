import 'package:expense_app/src/utils/theme/theme_provider.dart';
import 'package:expense_app/src/utils/widget/on_boarding/first_page.dart';
import 'package:expense_app/src/utils/widget/on_boarding/second_page.dart';
import 'package:expense_app/src/utils/widget/on_boarding/third_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPressed() {
    _pageController.animateToPage(
      _currentPage += 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Stack(
          children: [
            // Pageview
            PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                FirstPage(
                  onPressed: _onPressed,
                ),
                SecondPage(
                  onPressed: _onPressed,
                ),
                const ThirdPage(),
              ],
            ),
            Align(
              alignment: const Alignment(0, 0.2),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  dotColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
