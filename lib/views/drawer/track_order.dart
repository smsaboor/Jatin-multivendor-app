import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/common_view/tracking_order.dart';
import 'package:multivendor_app/views/dashboard/dashboard_view.dart';

class TrackOrderView extends StatefulWidget {
  const TrackOrderView({Key? key}) : super(key: key);

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _bottomNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: MyConstant.defaultPadding),
                const UiAppBar(
                  text: 'Your Order',
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          NavByMe.push(context, const TrackingOrderView());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding),
                              border: Border.all(color: MyConstant.myblack),
                            ),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 80,
                                      child: Image.asset(
                                        "assets/tracking_order.png",
                                      ),
                                    ),
                                    const Text(
                                      "Track",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: MyConstant.green),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "XYZ Delivery",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: MyConstant.primaryColor),
                                    ),
                                    Text(
                                      "Shipped",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: MyConstant.black),
                                    ),
                                    Text(
                                      "House Number,Delhi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: MyConstant.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    "assets/deal_01.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: MyConstant.defaultPadding,
                      );
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

  _bottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(MyConstant.defaultPadding),
      child: UiElevatedButton(
        text: "Continue Shopping",
        onPressed: () {
          NavByMe.push(context, const Dashboard());
        },
      ),
    );
  }
}
