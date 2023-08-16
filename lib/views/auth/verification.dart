import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/dashboard/dashboard_view.dart';

import '../../shared/ui_navigation.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveByNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/verified_tick.png"),
            const SizedBox(height: MyConstant.defaultPadding),
            const Text(
              "Verified",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0XFF000000),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _moveByNext() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        NavByMe.push(context, const Dashboard());
      },
    );
  }
}
