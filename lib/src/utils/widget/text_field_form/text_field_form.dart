import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  const TextFieldForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  }) : isPassword = false;

  const TextFieldForm.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  }) : isPassword = true;

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String?)? validator;
  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  bool isVisible = false;

  void _onTap() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && !isVisible,
      validator: widget.validator,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _onTap,
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
