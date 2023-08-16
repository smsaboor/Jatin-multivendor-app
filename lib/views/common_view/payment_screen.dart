import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/model/nav_model.dart';
import 'package:multivendor_app/shared/assets_svg.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';

import 'payment_success.dart';

class PaymentScreenView extends StatefulWidget {
  const PaymentScreenView({Key? key}) : super(key: key);

  @override
  State<PaymentScreenView> createState() => _PaymentScreenViewState();
}

class _PaymentScreenViewState extends State<PaymentScreenView> {
  final List<MyModel> bankNameModel = [
    MyModel(
        text: 'Kotak Mahindra Bank UPI',
        imgSrc: upiSvg.toString(),
        secondText: "Account No.  xxxx xxxx 6746"),
    MyModel(
        text: 'Google Pay UPI',
        imgSrc: gpay.toString(),
        secondText: "tejasaher67@gmail.com"),
  ];
  final List<MyModel> paymentMethod = [
    MyModel(
      text: 'UPI',
      imgSrc: upiIdSvg.toString(),
    ),
    MyModel(
      text: 'Wallets',
      imgSrc: walletSvg.toString(),
    ),
    MyModel(imgSrc: creditCard.toString(), text: "Credit/ Debit/ ATM Card"),
    MyModel(imgSrc: upiIdSvg.toString(), text: "Cash On Delivery"),
  ];
  int currentBankIndex = 0;
  int currentOptionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: MyConstant.defaultPadding / 2),
                const UiAppBar(
                  text: 'Bill Total : ₹43',
                ),
                const SizedBox(height: MyConstant.defaultPadding / 2),
                const ListTile(
                  title: Text("Amount to be paid"),
                  trailing: Text("₹43.00"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Suggested for you",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF161616)),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      var data = bankNameModel.elementAt(index);
                      return ListTile(
                        onTap: () {
                          setState(() {
                            currentBankIndex = index;
                          });
                        },
                        leading: IconButton(
                          icon: Icon(
                            Icons.adjust,
                            color: currentBankIndex == index
                                ? const Color(0xFF2834D6)
                                : Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        title: Text(data.text),
                        subtitle: Text(data.secondText ?? ""),
                        trailing: SvgPicture.asset(data.imgSrc),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: MyConstant.defaultPadding,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "All other option",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF161616)),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: paymentMethod.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = paymentMethod.elementAt(index);
                      return ListTile(
                        onTap: () {
                          setState(() {
                            currentOptionIndex = index;
                          });
                        },
                        leading: IconButton(
                          icon: currentOptionIndex == index
                              ? const Icon(
                                  Icons.fiber_manual_record_outlined,
                                  color: Color(0xFF2834D6),
                                )
                              : const Icon(Icons.fiber_manual_record_outlined,
                                  color: Colors.grey),
                          onPressed: () {},
                        ),
                        title: Text(data.text),
                        subtitle: Text(data.secondText ?? ""),
                        trailing: SvgPicture.asset(data.imgSrc),
                      );
                    },
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.add,
                    color: MyConstant.myblack,
                  ),
                  title: Text("Gift Card"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: UiElevatedButton(
                    text: "Proceed To Pay",
                    onPressed: () {
                      NavByMe.push(context, const PaymentSucessView());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
