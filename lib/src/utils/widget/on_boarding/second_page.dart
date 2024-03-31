import 'package:expense_app/src/utils/helpers_variabel/helpers_variabel.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 150),
          child: Image.asset(
            HelpersVariabel.imageTwoOnBoarding,
            width: 400,
          ),
        ),
        CustomPaint(
          size: Size(
            double.infinity,
            (double.infinity * 0.7246376811594203).toDouble(),
          ),
          painter: RPSCustomPainter(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            width: double.infinity,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  HelpersVariabel.titleTwoOnBoarding,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  HelpersVariabel.subTitleTwoOnBoarding,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final Color color;
  RPSCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path = Path();
    path.moveTo(size.width * -0.0024155, size.height * 0.0033333);
    path.lineTo(0, size.height * 0.9966667);
    path.lineTo(size.width * 1.0048309, size.height * 1.0033333);
    path.lineTo(size.width, size.height * 0.0033333);
    path.quadraticBezierTo(size.width * 0.6843961, size.height * -0.2270667,
        size.width * 0.4877295, size.height * -0.2052000);
    path.quadraticBezierTo(size.width * 0.2792029, size.height * -0.2084000,
        size.width * -0.0024155, size.height * 0.0033333);
    path.close();

    canvas.drawPath(path, paintFill);

    // Layer 1

    Paint paintStroke = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
