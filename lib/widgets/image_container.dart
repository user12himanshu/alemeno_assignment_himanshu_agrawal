import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final Widget? child;
  const ImageContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration:
          const ShapeDecoration(color: Colors.grey, shape: CircleBorder()),
      child: child,
    );
  }
}
