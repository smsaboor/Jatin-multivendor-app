import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';

import '../shared/ui_navigation.dart';

class UiAppBar extends StatelessWidget {
  final String text;
  final bool? isTrailing;
  final bool? isSub;
  final String? subText;
  final VoidCallback? onTap;
  const UiAppBar(
      {Key? key,
      required this.text,
      this.isTrailing = false,
      this.onTap,
      this.isSub = false,
      this.subText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: SizedBox(
        height: 60,
        child: ListTile(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: MyConstant.black,
              ),
              onPressed: () {
                NavByMe.pop(context);
              }),
          title: Text(
            text,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          subtitle: isSub! ? Text(subText ?? "") : const Text(""),
          trailing: isTrailing!
              ? IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.search, color: Colors.black, size: 28),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
