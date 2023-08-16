import 'package:flutter/material.dart';

import '../shared/my_constant.dart';

class UiOnboardingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const UiOnboardingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const CircleAvatar(
        radius: 32,
        backgroundColor: MyConstant.primaryColor,
        child: Icon(Icons.chevron_right, color: MyConstant.white, size: 50),
      ),
    );
  }
}
