import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_offer_container.dart';
import 'package:multivendor_app/model/nav_model.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/shared/ui_section_tile.dart';
import 'package:multivendor_app/views/common_view/checkout.dart';

class CommonItemFullView extends StatefulWidget {
  final bool? isVeg;
  final bool? isRes;
  const CommonItemFullView({Key? key, this.isVeg = false, this.isRes = false})
      : super(key: key);

  @override
  State<CommonItemFullView> createState() => _CommonItemFullViewState();
}

class _CommonItemFullViewState extends State<CommonItemFullView> {
  bool onPressed = false;
  bool isAdded = false;
  int value = 1;
  String? _dropdownValue;

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
  final List<MyModel> resGridModel = [
    MyModel(imgSrc: "assets/res_grd_01.png", text: "New Cauliflower"),
    MyModel(imgSrc: "assets/res_grd_02.png", text: "Onion"),
    MyModel(imgSrc: "assets/res_grd_03.png", text: "New Potato (aloo)"),
    MyModel(imgSrc: "assets/res_grd_04.png", text: "Brocoli"),
    MyModel(imgSrc: "assets/res_grd_05.png", text: "Green Chilli"),
    MyModel(imgSrc: "assets/res_grd_06.png", text: "Lady's Finger"),
    MyModel(imgSrc: "assets/ord_01.png", text: "Carrot"),
    MyModel(imgSrc: "assets/ord_03.png", text: "Tomato"),
  ];

  final List<MyModel> vegetableGridModel = [
    MyModel(imgSrc: "assets/veg_cauli.png", text: "New Cauliflower"),
    MyModel(imgSrc: "assets/veg_onion.png", text: "Onion"),
    MyModel(imgSrc: "assets/veg_potato.png", text: "New Potato (aloo)"),
    MyModel(imgSrc: "assets/veg_brocoli.png", text: "Brocoli"),
    MyModel(imgSrc: "assets/veg_green_chilli.png", text: "Green Chilli"),
    MyModel(imgSrc: "assets/veg_lady_finger.png", text: "Lady's Finger"),
    MyModel(imgSrc: "assets/veg_carrot.png", text: "Carrot"),
    MyModel(imgSrc: "assets/veg_tomato.png", text: "Tomato"),
  ];
  bool onPressedBottom = false;
  bool isAddedBottom = false;
  int valueBottom = 1;

  String dropdownValue = "Select your Quantity";
  final GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar:
              onPressedBottom ? _bottomNavBar() : const SizedBox(),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: MyConstant.defaultPadding),
                    UiAppBar(
                      text: widget.isVeg!
                          ? "New Potato (Aloo)"
                          : widget.isRes!
                              ? "Veg Briyani"
                              : "Nourish Atta",
                      isTrailing: true,
                    ),
                    const SizedBox(
                      height: MyConstant.defaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            height: 160,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding),
                              border: Border.all(
                                color: MyConstant.grey,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  widget.isVeg!
                                      ? "assets/ord_history.png"
                                      : widget.isRes!
                                          ? "assets/res_grd_01.png"
                                          : "assets/gro_atta_05.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: MyConstant.defaultPadding,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MyConstant.defaultPadding),
                                  border: Border.all(
                                    color: MyConstant.grey,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      widget.isVeg!
                                          ? "assets/veg_fv_02.png"
                                          : widget.isRes!
                                              ? "assets/res_grd_01.png"
                                              : "assets/detail_gro_01.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: MyConstant.defaultPadding / 2,
                              ),
                              Container(
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MyConstant.defaultPadding),
                                  border: Border.all(
                                    color: MyConstant.grey,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      widget.isVeg!
                                          ? "assets/full_view_potato_02.png"
                                          : widget.isRes!
                                              ? "assets/res_grd_01.png"
                                              : "assets/detail_gro_02.png",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: MyConstant.defaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.isVeg!
                                    ? "New Potato (Aloo)"
                                    : widget.isRes!
                                        ? "Veg Briyani"
                                        : "Nourish Atta",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
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
                          const Text(
                            "50Kg",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding,
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
                          Container(
                            height: 40,
                            width: double.infinity,
                            color: MyConstant.primaryColor,
                            child: ListTile(
                              dense: true,
                              title: Text(
                                dropdownValue,
                                style: const TextStyle(
                                  color: MyConstant.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  final dynamic button = _menuKey.currentState;
                                  button.showButtonMenu();
                                },
                                icon: const Icon(Icons.expand_more,
                                    color: MyConstant.white),
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: const BorderSide(
                                  color: MyConstant.primaryColor),
                            ),
                            key: _menuKey,
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: '1',
                                child: Text('1'),
                              ),
                              const PopupMenuItem<String>(
                                value: '5',
                                child: Text('5'),
                              ),
                              const PopupMenuItem<String>(
                                value: '10',
                                child: Text('10'),
                              ),
                              const PopupMenuItem<String>(
                                value: '15',
                                child: Text('15'),
                              ),
                              const PopupMenuItem<String>(
                                value: '20',
                                child: Text('20'),
                              ),
                              const PopupMenuItem<String>(
                                value: '25',
                                child: Text('25'),
                              ),
                              // Add more options as needed
                            ],
                            onSelected: (String value) {
                              setState(
                                () {
                                  dropdownValue = value;
                                },
                              );
                            },
                          ),
                          const UiSectionTile(text: "Product Detail"),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Tristique estas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolor tellus nulla.Lorem ips  r sit amet consectetur. Tristique egestas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolor tellus nulla.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const UiSectionTile(text: "Nutrient Value & Benifit"),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Tristique estas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolo",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const UiSectionTile(text: "Storage Tips"),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Tristique estas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolo",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const UiSectionTile(text: "Manufacturer Detail"),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Tristique estas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolo",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const UiSectionTile(text: "Product Class"),
                          const Text(
                            "Fruits & Vegitable",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const UiSectionTile(text: "Seller"),
                          const Text(
                            "Lorem ipsum dolor sit amet ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                onPressed: () {
                                  NavByMe.pop(context);
                                },
                                icon: const Icon(Icons.keyboard_arrow_up,
                                    color: MyConstant.primaryColor),
                                label: const Text(
                                  " Less ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: MyConstant.primaryColor),
                                ),
                              ),
                            ),
                          ),
                          const UiSectionTile(text: "Similar Products"),
                          SizedBox(
                            height: 260,
                            child: _buildSimilarProducts(),
                          ),
                        ],
                      ),
                    )
                  ],
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
                  isAddedBottom = false;
                  onPressedBottom = false;
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
                onPressedBottom = true;
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

  _buildSimilarProducts() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: MyConstant.defaultPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.isVeg!
            ? vegetableGridModel.length
            : widget.isRes!
                ? resGridModel.length
                : groAttaModel.length,
        itemBuilder: (BuildContext context, int index) {
          var data = widget.isVeg!
              ? vegetableGridModel.elementAt(index)
              : widget.isRes!
                  ? resGridModel.elementAt(index)
                  : groAttaModel.elementAt(index);
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
                      const SizedBox(
                        width: MyConstant.defaultPadding / 3,
                      ),
                      const Text(
                        "₹ 225",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      const Spacer(),
                      onPressed
                          ? _buildAddBottomItem()
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
                      const SizedBox(
                        width: MyConstant.defaultPadding / 3,
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

  _bottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          NavByMe.push(context, const CheckoutView());
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
            color: MyConstant.primaryColor,
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: MyConstant.defaultPadding / 2,
                    ),
                    Text(
                      "$value Item",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyConstant.white),
                    ),
                    const Text(
                      "₹ 117.00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MyConstant.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "View Cart",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyConstant.white),
              ),
              const SizedBox(
                width: MyConstant.defaultPadding / 2,
              ),
              Image.asset(
                "assets/arrow.png",
                height: 15,
              ),
              const SizedBox(
                width: MyConstant.defaultPadding / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
