import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/wallet/add_money.dart';
import 'package:multivendor_app/views/wallet/transaction_history.dart';

class MyWalletView extends StatefulWidget {
  const MyWalletView({Key? key}) : super(key: key);

  @override
  State<MyWalletView> createState() => _MyWalletViewState();
}

class _MyWalletViewState extends State<MyWalletView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding,
                  vertical: MyConstant.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 32,
                      ),
                      Spacer(),
                      Text(
                        "₹ 9,890",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0XFf00829E)),
                      )
                    ],
                  ),
                  const SizedBox(height: MyConstant.defaultPadding),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 38,
                          child: UiElevatedButton(
                            text: "Add Money",
                            onPressed: () {
                              NavByMe.push(context, const AddMoneyView());
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: MyConstant.defaultPadding / 2),
                      Flexible(
                        child: SizedBox(
                          height: 38,
                          child: UiElevatedButton(
                            text: "History",
                            onPressed: () {
                              NavByMe.push(context, const TransactionHistory());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: MyConstant.defaultPadding),
                  const Divider(
                    thickness: 1,
                    color: MyConstant.grey,
                  ),
                  const SizedBox(height: MyConstant.defaultPadding),
                  const Text(
                    "Transaction History",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const ListTile(
                    title: Text("Added From Bank Account"),
                    subtitle: Text("6 Days ago"),
                    trailing: Text("+₹500", style: MyTextStyles.incomeText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Transfer to Micheal"),
                    subtitle: Text("6 Days ago"),
                    trailing: Text("-₹150", style: MyTextStyles.expenseText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Added From Bank Account"),
                    subtitle: Text("6 Days ago"),
                    trailing: Text("+₹500", style: MyTextStyles.incomeText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Transfer to Micheal"),
                    subtitle: Text("6 Days ago"),
                    trailing: Text("-₹150", style: MyTextStyles.expenseText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Added From Bank Account"),
                    trailing: Text("+₹500", style: MyTextStyles.incomeText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Transfer to Micheal"),
                    trailing: Text("-₹150", style: MyTextStyles.expenseText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Added From Bank Account"),
                    trailing: Text("+₹500", style: MyTextStyles.incomeText),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Transfer to Micheal"),
                    subtitle: Text("6 Days ago"),
                    trailing: Text("-₹150", style: MyTextStyles.expenseText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
