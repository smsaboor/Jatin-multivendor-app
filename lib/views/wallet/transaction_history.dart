import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Transaction History",
          style: MyTextStyles.appBarText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ListTile(
              title: Text("Added From Bank Account"),
              subtitle: Text("6 Days ago"),
              trailing: Text("+₹500", style: MyTextStyles.incomeText),
            ),
            Divider(),
            ListTile(
              title: Text("Transfer to Micheal"),
              subtitle: Text("6 Days ago"),
              trailing: Text("-₹150", style: MyTextStyles.expenseText),
            ),
            Divider(),
            ListTile(
              title: Text("Added From Bank Account"),
              subtitle: Text("6 Days ago"),
              trailing: Text("+₹500", style: MyTextStyles.incomeText),
            ),
            Divider(),
            ListTile(
              title: Text("Transfer to Micheal"),
              subtitle: Text("6 Days ago"),
              trailing: Text("-₹150", style: MyTextStyles.expenseText),
            ),
            Divider(),
            ListTile(
              title: Text("Added From Bank Account"),
              trailing: Text("+₹500", style: MyTextStyles.incomeText),
            ),
            Divider(),
            ListTile(
              title: Text("Transfer to Micheal"),
              trailing: Text("-₹150", style: MyTextStyles.expenseText),
            ),
            Divider(),
            ListTile(
              title: Text("Added From Bank Account"),
              trailing: Text("+₹500", style: MyTextStyles.incomeText),
            ),
            Divider(),
            ListTile(
              title: Text("Transfer to Micheal"),
              subtitle: Text("6 Days ago"),
              trailing: Text("-₹150", style: MyTextStyles.expenseText),
            ),
          ],
        ),
      ),
    );
  }
}
