import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';

import '../../shared/assets_svg.dart';
import '../dashboard/dashboard_view.dart';

class TrackingOrderView extends StatefulWidget {
  const TrackingOrderView({Key? key}) : super(key: key);

  @override
  State<TrackingOrderView> createState() => _TrackingOrderViewState();
}

class _TrackingOrderViewState extends State<TrackingOrderView> {
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
                  text: 'Track Order',
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                const Text(
                  "Order No. #123-456",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xFF352641),
                  ),
                ),
                SizedBox(
                  child: Image.asset("assets/Overlay.png"),
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(MyConstant.defaultPadding),
                      border: Border.all(color: MyConstant.myblack),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: MyConstant.defaultPadding / 2,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: SvgPicture.asset(xyz.toString(),
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: MyConstant.defaultPadding / 2,
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
