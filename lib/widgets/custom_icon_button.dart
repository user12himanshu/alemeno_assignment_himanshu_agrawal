import 'package:amlemeno_assignment_test_himanshu_agrawal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String assetPath;
  final double buttonSize;

  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.assetPath,
      required this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: buttonSize,
          width: buttonSize,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: CustomAppTheme.primaryColor,
            shadows: [
              BoxShadow(
                color: Color(0x4C000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(assetPath, height: 26, width: 36),
          )),
    );
  }
}
