import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: CustomIconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        buttonSize: 45,
        assetPath: 'assets/svg/back_arrow.svg',
      ),
    );
  }
}
