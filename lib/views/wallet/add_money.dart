import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/common_view/payment_screen.dart';

class AddMoneyView extends StatefulWidget {
  const AddMoneyView({Key? key}) : super(key: key);

  @override
  State<AddMoneyView> createState() => _AddMoneyViewState();
}

class _AddMoneyViewState extends State<AddMoneyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Add Money",
          style: MyTextStyles.appBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MyConstant.defaultPadding / 2),
        child: Column(
          children: [
            const Text(
              "Total Balance",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const SizedBox(height: MyConstant.defaultPadding),
            const Divider(
              thickness: 0.7,
            ),
            const SizedBox(height: MyConstant.defaultPadding),
            const Text("Add Money"),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MyConstant.defaultPadding * 7.5),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "₹ 200",
                    hintStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MyConstant.defaultPadding * 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding * 3),
              child: SizedBox(
                height: 60,
                child: UiElevatedButton(
                  text: "Add Money",
                  onPressed: () {
                    NavByMe.push(context, const PaymentScreenView());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
