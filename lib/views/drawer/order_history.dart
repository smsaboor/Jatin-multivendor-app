import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/others/rating_review.dart';

import '../../shared/my_constant.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({Key? key}) : super(key: key);

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: MyConstant.defaultPadding),
              const UiAppBar(
                text: "Order History",
                isTrailing: true,
              ),
              _buildOrderHistoryContainer(),
            ],
          ),
        ),
      ),
    );
  }

  _buildOrderHistoryContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MyConstant.defaultPadding / 2,
          vertical: MyConstant.defaultPadding),
      child: GestureDetector(
        onTap: () {
          NavByMe.push(context, const RatingAndReview());
        },
        child: Container(
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyConstant.defaultPadding),
            border: Border.all(
              color: MyConstant.grey,
            ),
          ),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: MyConstant.defaultPadding / 2),
              Image.asset("assets/ord_history.png"),
              const SizedBox(width: MyConstant.defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New Potato (Aloo)",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const Text(
                    "1Kg",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Row(
                    children: const [
                      Text(
                        "₹ 27",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      SizedBox(width: MyConstant.defaultPadding / 2),
                      Text(
                        "₹ 37",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: MyConstant.defaultPadding / 2),
              Column(
                children: [
                  const SizedBox(height: MyConstant.defaultPadding),
                  _buildOfferContainer(),
                ],
              ),
              const SizedBox(width: MyConstant.defaultPadding / 2),
            ],
          ),
        ),
      ),
    );
  }

  _buildOfferContainer() {
    return Container(
      height: 15,
      width: 60,
      decoration: const BoxDecoration(
        color: MyConstant.primaryColor,
      ),
      child: const Center(
        child: Text(
          "13 % OFF",
          style: TextStyle(
              color: MyConstant.white,
              fontSize: 8,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
