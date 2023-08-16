import 'package:flutter/material.dart';

import '../shared/my_constant.dart';

class UiElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const UiElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MyConstant.defaultPadding / 2),
            ),
            backgroundColor: MyConstant.primaryColor,
            foregroundColor: MyConstant.white),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
