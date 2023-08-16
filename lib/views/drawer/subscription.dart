import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/subscription_top.png"),
                const SizedBox(height: MyConstant.defaultPadding),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Smart Dish & Free Delivery plan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: MyConstant.black),
                  ),
                ),
                const SizedBox(height: MyConstant.defaultPadding / 2),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Start at ₹299 Per Month",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: MyConstant.black),
                  ),
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: _buildSubscriptionContainer(index),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: MyConstant.defaultPadding,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionContainer(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        border: Border.all(
          width: 1.5,
          color:
              currentIndex == index ? MyConstant.primaryColor : MyConstant.grey,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: MyConstant.defaultPadding / 1.5),
          const Padding(
            padding: EdgeInsets.only(left: MyConstant.defaultPadding),
            child: Text(
              "Costumer Profiling",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: MyConstant.black),
            ),
          ),
          const SizedBox(height: MyConstant.defaultPadding / 1.5),
          const Padding(
            padding: EdgeInsets.only(left: MyConstant.defaultPadding),
            child: Text(
              "12 month(63% off)",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  color: MyConstant.black),
            ),
          ),
          const SizedBox(height: MyConstant.defaultPadding / 1.5),
          const Padding(
            padding: EdgeInsets.only(left: MyConstant.defaultPadding),
            child: Text(
              "₹ 299 per month",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: MyConstant.black),
            ),
          ),
          const SizedBox(height: MyConstant.defaultPadding / 1.5),
          const Padding(
            padding: EdgeInsets.only(left: MyConstant.defaultPadding),
            child: Text(
              "Total - ₹ 3,499",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0XFF5C5C5C),
              ),
            ),
          ),
          const SizedBox(height: MyConstant.defaultPadding * 1.5),
          Container(
            height: 32,
            color: const Color(0XFFE3E3E3),
            child: Row(
              children: [
                const SizedBox(width: MyConstant.defaultPadding),
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/sub_meal.png",
                      color: MyConstant.primaryColor),
                ),
                const SizedBox(width: MyConstant.defaultPadding / 2),
                const Text(
                  "Meal is more expensive",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: MyConstant.defaultPadding),
              ],
            ),
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(MyConstant.defaultPadding / 2),
                bottomLeft: Radius.circular(MyConstant.defaultPadding / 2),
              ),
              color: MyConstant.primaryColor,
            ),
            child: const Center(
              child: Text(
                "Buy now",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: MyConstant.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
