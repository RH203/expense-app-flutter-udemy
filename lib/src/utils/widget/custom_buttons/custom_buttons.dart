import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    required this.height,
    required this.padding,
    required this.fontSize,
    required this.fontWeight,
  });

  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;
  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: widget.padding,
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
