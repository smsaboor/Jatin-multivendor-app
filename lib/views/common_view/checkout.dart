import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/common_widget/ui_offer_container.dart';
import 'package:multivendor_app/model/nav_model.dart';
import 'package:multivendor_app/shared/assets_svg.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/shared/ui_section_tile.dart';
import 'package:multivendor_app/views/common_view/add_address.dart';
import 'package:multivendor_app/views/common_view/payment_screen.dart';

class CheckoutView extends StatefulWidget {
  final bool isFinal;
  const CheckoutView({Key? key, this.isFinal = false}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final List<MyModel> groAttaModel = [
    MyModel(imgSrc: "assets/gro_atta_01.png", text: "Abhivadan Atta"),
    MyModel(imgSrc: "assets/gro_atta_02.png", text: "Ashirvad Super Food"),
    MyModel(imgSrc: "assets/gro_atta_03.png", text: "Jiwa Atta"),
    MyModel(imgSrc: "assets/gro_atta_04.png", text: "Bharat Atta"),
    MyModel(imgSrc: "assets/gro_atta_05.png", text: "Nourish Atta"),
    MyModel(imgSrc: "assets/gro_att_06.png", text: "Ashirvad Atta"),
    MyModel(imgSrc: "assets/gro_atta_07.png", text: "Rajanan Atta"),
    MyModel(imgSrc: "assets/gro_atta_08.png", text: "Chakki Atta"),
  ];

  bool onPressedBottom = false;
  bool isAddedBottom = false;
  int valueBottom = 1;
  bool onPressed = false;
  bool isAdded = false;
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: MyConstant.defaultPadding),
                const UiAppBar(
                  text: 'Checkout',
                ),
                const SizedBox(height: MyConstant.defaultPadding),
                widget.isFinal
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MyConstant.defaultPadding / 2),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding / 2),
                            border: Border.all(color: MyConstant.grey),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                  width: MyConstant.defaultPadding / 3),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                      height: MyConstant.defaultPadding),
                                  const Text(
                                    "Choose Delivery Slot",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: MyConstant.black),
                                  ),
                                  const SizedBox(
                                      height: MyConstant.defaultPadding / 2),
                                  Container(
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MyConstant.defaultPadding),
                                      border:
                                          Border.all(color: MyConstant.black),
                                      color: const Color(0xFfE4E4E4),
                                    ),
                                    child: const ListTile(
                                      minLeadingWidth:
                                          kMinInteractiveDimension / 3,
                                      dense: true,
                                      leading: Icon(Icons.access_time),
                                      title: Text(
                                        "31 Dec, Sat 9:00 AM - 1:30 PM",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      trailing: Icon(Icons.expand_more),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("1 Shipment"),
                                  const Text(
                                    "Delivery Charge _ Free",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                      height: MyConstant.defaultPadding / 2),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MyConstant.defaultPadding),
                                      border:
                                          Border.all(color: MyConstant.grey),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text("View 1 Items"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: MyConstant.defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding / 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(MyConstant.defaultPadding / 2),
                      border: Border.all(color: MyConstant.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MyConstant.defaultPadding / 2),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: MyConstant.defaultPadding / 2,
                              ),
                              Icon(Icons.access_time),
                              SizedBox(
                                width: MyConstant.defaultPadding / 2,
                              ),
                              Text("Delivery In 8 minute"),
                              Spacer(),
                              UiOfferContainer(),
                            ],
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/gro_atta_05.png"),
                              ),
                              const Text(
                                "Nourish Atta",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(flex: 1),
                              Container(
                                height: 28,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        MyConstant.defaultPadding / 2),
                                    color: MyConstant.primaryColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.access_time,
                                        size: 18, color: MyConstant.white),
                                    Text(
                                      "29 min",
                                      style: TextStyle(
                                          color: MyConstant.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "₹ 270",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              const SizedBox(
                                width: MyConstant.defaultPadding,
                              ),
                              const Text(
                                "₹ 370",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: MyConstant.defaultPadding / 2,
                              ),
                              const UiOfferContainer(),
                              const Spacer(),
                              _buildAddBottomItem(),
                            ],
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(MyConstant.defaultPadding / 2),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        const UiSectionTile(text: "Before You Checkout"),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        SizedBox(
                          height: 260,
                          child: buildSimilarProducts(),
                        ),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding),
                            color: MyConstant.white,
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(coupon.toString()),
                            title: const Text("Use Promo Code"),
                            trailing: const Icon(Icons.chevron_right_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding),
                            color: MyConstant.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: MyConstant.defaultPadding,
                                ),
                                const Text(
                                  "Add Instructions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: MyConstant.defaultPadding,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyConstant.defaultPadding / 2),
                                          ),
                                          hintText: "write a comment"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding),
                            color: MyConstant.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: MyConstant.defaultPadding,
                                ),
                                Text(
                                  "Cancellation Policy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 80,
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.")),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const UiSectionTile(
                          text: 'Price Detail',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding),
                            elevation: 5,
                            child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MyConstant.defaultPadding),
                                color: MyConstant.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: MyConstant.defaultPadding,
                                    ),
                                    Text(
                                      "(two Items)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Subtotal",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      trailing: Text(
                                        "₹ 674.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Shipping",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      trailing: Text(
                                        "₹ 40.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Tax",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      trailing: Text(
                                        "₹ 10.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(
                                MyConstant.defaultPadding),
                            elevation: 5,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MyConstant.defaultPadding),
                                color: MyConstant.white,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: ListTile(
                                  title: Text(
                                    "Total",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  trailing: Text(
                                    "₹ 724.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: MyConstant.defaultPadding,
                        ),
                        UiElevatedButton(
                          text: widget.isFinal
                              ? "Add Payment Process"
                              : "Choose address at next step",
                          onPressed: () {
                            widget.isFinal
                                ? NavByMe.push(
                                    context, const PaymentScreenView())
                                : _showBottomSheet();
                          },
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

  _buildAddBottomItem() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        color: MyConstant.primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (valueBottom == 0) {
                  valueBottom = 0;
                } else {
                  valueBottom = valueBottom - 1;
                }
              });
            },
            icon: const Icon(
              Icons.remove,
              size: 20,
              color: MyConstant.white,
            ),
          ),
          Text(
            valueBottom.toString(),
            style: const TextStyle(color: MyConstant.white),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                valueBottom = valueBottom + 1;
              });
            },
            icon: const Icon(
              Icons.add,
              size: 20,
              color: MyConstant.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildAddItem() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        color: MyConstant.primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (value == 0) {
                  value = 0;
                } else {
                  value = value - 1;
                }
              });
            },
            icon: const Icon(
              Icons.remove,
              size: 20,
              color: MyConstant.white,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(color: MyConstant.white),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                value = value + 1;
              });
            },
            icon: const Icon(
              Icons.add,
              size: 20,
              color: MyConstant.white,
            ),
          ),
        ],
      ),
    );
  }

  buildSimilarProducts() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: MyConstant.defaultPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: groAttaModel.length,
        itemBuilder: (BuildContext context, int index) {
          var data = groAttaModel.elementAt(index);
          return Container(
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MyConstant.defaultPadding),
                color: MyConstant.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: MyConstant.defaultPadding / 2,
                  ),
                  const Align(
                      alignment: Alignment.topLeft, child: UiOfferContainer()),
                  const SizedBox(
                    height: MyConstant.defaultPadding / 2,
                  ),
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(data.imgSrc),
                    ),
                  ),
                  const SizedBox(
                    height: MyConstant.defaultPadding / 3,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.access_time,
                        size: 18,
                      ),
                      Text(
                        "29 min",
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 8),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: MyConstant.defaultPadding / 3,
                  ),
                  Text(
                    data.text,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  const SizedBox(
                    height: MyConstant.defaultPadding / 3,
                  ),
                  const Text(
                    "1 Bag (40kg-60kg )",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  const SizedBox(
                    height: MyConstant.defaultPadding / 3,
                  ),
                  Row(
                    children: [
                      const Text(
                        "₹ 225",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      const Spacer(),
                      onPressed
                          ? _buildAddItem()
                          : GestureDetector(
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundColor: MyConstant.primaryColor,
                                child: Icon(
                                  Icons.add,
                                  color: MyConstant.white,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  onPressed = true;
                                });
                              },
                            ),
                    ],
                  ),
                ],
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "Select A Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 32,
                  color: MyConstant.black,
                ),
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: MyConstant.primaryColor),
              onPressed: () {
                Navigator.pop(context);
                NavByMe.push(context, const AddAddressView());
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Add Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            )
          ],
        );
      },
    );
  }
}
