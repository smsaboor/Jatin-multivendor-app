import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';

class UiSectionTile extends StatelessWidget {
  final String text;
  final bool? isTrailing;
  final String? trailing;
  final VoidCallback? isOnTap;
  const UiSectionTile(
      {Key? key,
      required this.text,
      this.isTrailing = false,
      this.trailing = "",
      this.isOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isOnTap,
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0C0C0C),
        ),
      ),
      trailing: isTrailing!
          ? Text(
              trailing ?? "",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: MyConstant.primaryColor),
            )
          : const SizedBox(),
    );
  }
}
