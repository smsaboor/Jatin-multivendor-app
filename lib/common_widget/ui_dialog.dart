import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/auth/login.dart';

class Util {
  static void showDialogSuccessfullyRegistered(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => PlaceholderDialog(
        icon: Icon(
          Icons.add_circle,
          color: Colors.teal,
          size: 80.0,
        ),
        title: 'Registered Successfully',
        message: 'congratulation you registered successfully',
        actions: [
          TextButton(
            onPressed: () =>
                NavByMe.pushCompleteReplacement(context, LoginView()),
            child: Text('!Got It'),
          ),
        ],
      ),
    );
  }

  static showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Container(
                height: 80,
                width: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Loading..'),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: icon,
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
            ),
      content: message == null
          ? null
          : Text(
              message!,
              textAlign: TextAlign.center,
            ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
