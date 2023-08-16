import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_offer_container.dart';
import 'package:multivendor_app/model/nav_model.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/shared/ui_section_tile.dart';
import 'package:multivendor_app/views/common_view/common_full_view.dart';

class CommonItemView extends StatefulWidget {
  final bool? isVeg;
  final bool? isRes;
  final bool? isVendor;
  const CommonItemView(
      {Key? key, this.isVeg = false, this.isRes = false, this.isVendor = false})
      : super(key: key);

  @override
  State<CommonItemView> createState() => _CommonItemViewState();
}

class _CommonItemViewState extends State<CommonItemView> {
  final List<MyModel> vendorModel = [
    MyModel(
      text: 'Bikaner',
      imgSrc: "assets/vendor.png",
    ),
    MyModel(
      text: 'Panjabi Tadka',
      imgSrc: "assets/vendor.png",
    ),
    MyModel(
      text: 'Amit Foods',
      imgSrc: "assets/vendor.png",
    ),
    MyModel(
      text: 'Dominos',
      imgSrc: "assets/dominos.png",
    ),
  ];
  final List<MyModel> myResModel = [
    MyModel(
      text: 'Indian',
      imgSrc: "assets/res_home_01.png",
    ),
    MyModel(
      text: 'Panjabi',
      imgSrc: "assets/res_home_02.png",
    ),
    MyModel(
      text: 'Chinese',
      imgSrc: "assets/res_home_03.png",
    ),
    MyModel(
      text: 'Maharastrian',
      imgSrc: "assets/res_home_04.png",
    ),
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

  final List<MyModel> vegetableModel = [
    MyModel(imgSrc: "assets/veg_01.png", text: "Fresh vegetables"),
    MyModel(imgSrc: "assets/veg_02.png", text: "Fresh Fruits"),
    MyModel(imgSrc: "assets/veg_03.png", text: "Seasonal"),
    MyModel(imgSrc: "assets/veg_04.png", text: "Exotics"),
    MyModel(imgSrc: "assets/veg_05.png", text: "Freshly Cut & Sprout"),
    MyModel(imgSrc: "assets/veg_06.png", text: "Frozen Veg"),
    MyModel(imgSrc: "assets/veg_07.png", text: "Leafless & Herbs"),
  ];

  final List<MyModel> groceryModel = [
    MyModel(imgSrc: "assets/gro_pasta.png", text: "Pasta"),
    MyModel(imgSrc: "assets/gro_atta.png", text: "Atta"),
    MyModel(imgSrc: "assets/gro_dhall.png", text: "Dhall"),
    MyModel(imgSrc: "assets/gro_oil.png", text: "Oil"),
    MyModel(imgSrc: "assets/gro_sugar.png", text: "Sugar"),
    MyModel(imgSrc: "assets/gro_soap.png", text: "Soap"),
    MyModel(imgSrc: "assets/gro_snacks.png", text: "Snacks"),
  ];

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

  var list = [
    'Sort',
    'Fast Delivery',
    'Great Offer',
    'Low To High',
    'High to Low',
    'More'
  ];

  bool onPressed = false;
  bool isAdded = false;
  int value = 1;

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
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: MyConstant.defaultPadding),
                    UiAppBar(
                      text: widget.isVeg!
                          ? "Vegetable"
                          : widget.isRes!
                              ? "Indian"
                              : "Grocery",
                      isTrailing: true,
                      isSub: true,
                      subText: "239 Product",
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            _buildLeftScrollBar(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: MyConstant.defaultPadding / 2,
                            ),
                            SizedBox(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: _filterContainer(),
                            ),
                            const SizedBox(
                              height: MyConstant.defaultPadding / 2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: GridView.builder(
                                itemCount: widget.isVeg!
                                    ? vegetableGridModel.length
                                    : widget.isRes! || widget.isVendor!
                                        ? resGridModel.length
                                        : groAttaModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.56),
                                itemBuilder: (BuildContext context, int index) {
                                  var data = widget.isVeg!
                                      ? vegetableGridModel.elementAt(index)
                                      : widget.isRes! || widget.isVendor!
                                          ? resGridModel.elementAt(index)
                                          : groAttaModel.elementAt(index);
                                  return _buildGroGrid(data);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                onPressed
                    ? Positioned(
                        bottom: 50,
                        right: 10,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding / 2),
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
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildLeftScrollBar() {
    return RawScrollbar(
      thumbColor: MyConstant.primaryColor,
      shape: const StadiumBorder(),
      child: Material(
        elevation: 5.0,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.83,
          width: 72,
          child: ListView.separated(
            itemCount: widget.isVeg!
                ? vegetableModel.length
                : widget.isRes!
                    ? myResModel.length
                    : widget.isVendor!
                        ? vendorModel.length
                        : groceryModel.length,
            itemBuilder: (BuildContext context, int index) {
              var data = widget.isVeg!
                  ? vegetableModel.elementAt(index)
                  : widget.isRes!
                      ? myResModel.elementAt(index)
                      : widget.isVendor!
                          ? vendorModel.elementAt(index)
                          : groceryModel.elementAt(index);
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MyConstant.defaultPadding / 2,
                    vertical: MyConstant.defaultPadding / 2),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(data.imgSrc),
                    ),
                    Text(
                      data.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: MyConstant.defaultPadding / 2,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGroGrid(MyModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          NavByMe.push(
            context,
            CommonItemFullView(
              isVeg: widget.isVeg,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MyConstant.defaultPadding),
              color: MyConstant.white),
          child: Column(
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
                  height: 100,
                  width: 100,
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8),
                  ),
                ],
              ),
              const SizedBox(
                height: MyConstant.defaultPadding / 3,
              ),
              Text(
                data.text,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const SizedBox(width: 16),
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
                  const SizedBox(
                    width: MyConstant.defaultPadding / 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAddItem() {
    return Flexible(
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 3),
          color: MyConstant.primaryColor,
        ),
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: MyConstant.defaultPadding / 2,
            ),
            GestureDetector(
              child: const Text(
                "-",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  if (value == 0) {
                    value = 0;
                    onPressed = false;
                    isAdded = false;
                  } else {
                    value = value - 1;
                  }
                });
              },
            ),
            const SizedBox(
              width: MyConstant.defaultPadding / 1.5,
            ),
            Text(
              value.toString(),
              style: const TextStyle(color: MyConstant.white),
            ),
            const SizedBox(
              width: MyConstant.defaultPadding / 1.5,
            ),
            GestureDetector(
              child: const Text(
                "+",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  value = value + 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterContainer() {
    return Material(
      elevation: 5.0,
      child: ListView.separated(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var data = list.elementAt(index);
          return Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MyConstant.defaultPadding),
              border: Border.all(
                color: MyConstant.grey,
              ),
              color: MyConstant.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index == 0
                      ? Image.asset(
                          "assets/sort_gro.png",
                          height: 15,
                          width: 15,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: MyConstant.defaultPadding / 4,
                  ),
                  Center(
                    child: Text(
                      data,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyConstant.black),
                    ),
                  ),
                  index == 0 ? const Icon(Icons.expand_more) : const SizedBox(),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: MyConstant.defaultPadding / 2,
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
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Stack(
                children: [
                  SizedBox(
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MyConstant.defaultPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MyConstant.defaultPadding),
                                  border: Border.all(width: 2),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: MyConstant.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
                          Flex(
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
                          const SizedBox(
                            height: MyConstant.defaultPadding,
                          ),
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
                          const UiSectionTile(text: "Product Details"),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding / 2,
                          ),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Tristique estas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolor tellus nulla.Lorem ips  r sit amet consectetur. Tristique egestas netus sollicitudin aliquam suspendisse massa eleifend. Accumsan eu eget nisl dolor tellus nulla.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                NavByMe.push(
                                  context,
                                  CommonItemFullView(
                                    isRes: widget.isRes! ? true : false,
                                    isVeg: widget.isVeg! ? true : false,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.expand_more,
                                  color: MyConstant.primaryColor),
                              label: const Text(
                                "Read More Details",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: MyConstant.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressedBottom
                      ? Positioned(
                          bottom: 10,
                          right: 10,
                          left: 10,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MyConstant.defaultPadding / 2),
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
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        );
      },
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
}
