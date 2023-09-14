import 'package:flutter/material.dart';

import '../theme.dart';

class BackgroundContainer extends StatelessWidget {
  final bool isOnTop;
  final Widget? child;
  const BackgroundContainer({
    super.key,
    required this.isOnTop,
    this.child,
  });

  static const double borderRadius = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomAppTheme.secondryColor,
        borderRadius: BorderRadius.only(
          bottomLeft:
              isOnTop ? const Radius.circular(borderRadius) : Radius.zero,
          bottomRight:
              isOnTop ? const Radius.circular(borderRadius) : Radius.zero,
          topRight: isOnTop ? Radius.zero : const Radius.circular(borderRadius),
          topLeft: isOnTop ? Radius.zero : const Radius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}
