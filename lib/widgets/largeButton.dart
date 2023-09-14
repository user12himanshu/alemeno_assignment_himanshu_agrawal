import 'package:amlemeno_assignment_test_himanshu_agrawal/theme.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const LargeButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomAppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 3,
          shadowColor: Colors.black,
          padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20)),
      child: Text(
        text,
        style: CustomAppTheme.largeButtonText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
