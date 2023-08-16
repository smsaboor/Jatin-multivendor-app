import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/assets_svg.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/common_view/checkout.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final list = ['Home', 'Office', 'Others'];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/address_map.png",
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: MyConstant.defaultPadding),
                const UiAppBar(
                  text: 'Add Address',
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MyConstant.defaultPadding / 2),
                        ),
                        backgroundColor: MyConstant.primaryColor,
                        foregroundColor: MyConstant.white),
                    onPressed: () {},
                    icon: SvgPicture.asset(location.toString()),
                    label: const Text(
                      "Use Current Location",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: MyConstant.defaultPadding,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MyConstant.defaultPadding),
                      topRight: Radius.circular(MyConstant.defaultPadding),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset("assets/appbar_icon.png"),
                        title: const Text(
                          "A Block",
                          style: MyTextStyles.blockText,
                        ),
                        subtitle: const Text("Sector 63 ,noida"),
                        trailing: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "change",
                            style: TextStyle(color: MyConstant.primaryColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MyConstant.defaultPadding,
                            vertical: MyConstant.defaultPadding),
                        child: UiElevatedButton(
                            text: "Enter Complete Address",
                            onPressed: () {
                              _showBottomSheet();
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(MyConstant.defaultPadding),
              left: Radius.circular(MyConstant.defaultPadding))),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text("Enter Complete Address"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel,
                          size: 32,
                          color: MyConstant.black,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.7,
                    ),
                    const Text(
                      "save address as *",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: MyConstant.primaryColor),
                    ),
                    const SizedBox(
                      height: MyConstant.defaultPadding,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        itemCount: list.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MyConstant.defaultPadding / 2),
                                  border: Border.all(
                                      color: MyConstant.primaryColor),
                                  color: currentIndex == index
                                      ? MyConstant.primaryColor.withOpacity(0.7)
                                      : MyConstant.white),
                              child: Center(
                                child: Text(
                                  list.elementAt(index),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: MyConstant.defaultPadding,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: MyConstant.defaultPadding,
                    ),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding / 2),
                            ),
                            hintText: "Flat, House no, Floor, Tower"),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding / 2),
                            ),
                            hintText: "Street, Society, Landmark"),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding / 2),
                            ),
                            hintText: "Recipient’s name"),
                      ),
                    ),
                    UiElevatedButton(
                      text: "Save Address",
                      onPressed: () {
                        Navigator.pop(context);
                        NavByMe.push(
                          context,
                          const CheckoutView(
                            isFinal: true,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
