import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_app/shared/assets_svg.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_section_tile.dart';
import 'package:multivendor_app/views/auth/login.dart';
import 'package:multivendor_app/views/cart/my_cart.dart';
import 'package:multivendor_app/views/common_view/common_view.dart';
import 'package:multivendor_app/views/drawer/edit_profile.dart';
import 'package:multivendor_app/views/drawer/faqs.dart';
import 'package:multivendor_app/views/drawer/help_support.dart';
import 'package:multivendor_app/views/drawer/order_history.dart';
import 'package:multivendor_app/views/drawer/subscription.dart';
import 'package:multivendor_app/views/drawer/terms_conditions.dart';
import 'package:multivendor_app/views/drawer/track_order.dart';
import 'package:multivendor_app/views/wallet/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/nav_model.dart';
import '../../shared/ui_navigation.dart';
import '../others/notifications.dart';

class HomeView extends StatefulWidget {
  final bool? isRes;

  const HomeView({Key? key, this.isRes = false}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? userName;
  String? userPhone;
  String? token;

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = sharedPreferences.getString("fullName");
    userPhone = sharedPreferences.getString("phone");
    token = sharedPreferences.getString("accessToken");
    print("toke is:: ${sharedPreferences.getString("accessToken")}");
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final List<MyModel> navModel = [
    MyModel(
        imgSrc: editAsset.toString(),
        text: "Edit Profile",
        onTap: const EditProfileView()),
    MyModel(
        imgSrc: trackAsset.toString(),
        text: "Track Order",
        onTap: const TrackOrderView()),
    MyModel(
        imgSrc: searchAsset.toString(),
        text: "Help and Support",
        onTap: const HelpAndSupport()),
    MyModel(
        imgSrc: vectorAsset.toString(),
        text: "Terms and Conditions",
        onTap: const TermsAndConditions()),
    MyModel(imgSrc: faqAsset.toString(), text: "FAQ'S", onTap: const FaqView()),
  ];
  int currentIndex = 0;
  var items = [
    "assets/home_banner_png.png",
    "assets/home_banner_png.png",
    "assets/home_banner_png.png",
  ];
  final List<MyModel> myResModel = [
    MyModel(
        text: 'Indian',
        imgSrc: "assets/res_home_01.png",
        onTap: const CommonItemView(
          isRes: true,
        )),
    MyModel(
        text: 'Panjabi',
        imgSrc: "assets/res_home_02.png",
        onTap: const CommonItemView(
          isRes: true,
        )),
    MyModel(
        text: 'Chinese',
        imgSrc: "assets/res_home_03.png",
        onTap: const CommonItemView(
          isRes: true,
        )),
    MyModel(
      text: 'Maharastrian',
      imgSrc: "assets/res_home_04.png",
      onTap: const CommonItemView(
        isVeg: true,
      ),
    ),
  ];
  final List<MyModel> myResTopModel = [
    MyModel(
      text: 'Chinese Track',
      imgSrc: "assets/res_top_01.png",
    ),
    MyModel(
      text: 'Maharastrian',
      imgSrc: "assets/res_top_02.png",
    ),
    MyModel(
      text: 'Panjabi Special',
      imgSrc: "assets/res_top_03.png",
    ),
  ];
  final List<MyModel> myHomeModel = [
    MyModel(
        text: 'Food',
        imgSrc: "assets/home_cat_food.png",
        onTap: const HomeView(
          isRes: true,
        )),
    MyModel(
        text: 'Restaurant',
        imgSrc: "assets/home_cat_res.png",
        onTap: const HomeView(
          isRes: true,
        )),
    MyModel(
        text: 'Grocery',
        imgSrc: "assets/home_cat_grocery.png",
        onTap: const CommonItemView()),
    MyModel(
      text: 'Vegetable',
      imgSrc: "assets/home_cat_vege.png",
      onTap: const CommonItemView(
        isVeg: true,
      ),
    ),
  ];

  final List<MyModel> orderAgainRowOneModel = [
    MyModel(text: 'Strawberry Salad', imgSrc: "assets/ord_01.png"),
    MyModel(text: 'Punjabi Thali', imgSrc: "assets/ord_02.png"),
  ];
  final List<MyModel> orderAgainRowTwoModel = [
    MyModel(text: 'Masala Poha', imgSrc: "assets/ord_03.png"),
    MyModel(text: 'South Indian Thali', imgSrc: "assets/ord_04.png"),
  ];
  final List<MyModel> resRowOneModel = [
    MyModel(text: 'KFC', imgSrc: "assets/kfc.png"),
    MyModel(text: 'MC donald', imgSrc: "assets/mc_donald.png"),
  ];
  final List<MyModel> resRowTwoModel = [
    MyModel(text: 'Starbucks', imgSrc: "assets/starbucks.png"),
    MyModel(text: 'Dominos', imgSrc: "assets/dominos.png"),
  ];
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          drawer: _buildDrawer(),
          appBar: _buildAppBar(),
          key: _scaffoldState,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding / 4),
              child: Column(
                children: [
                  const SizedBox(height: MyConstant.defaultPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MyConstant.defaultPadding / 2),
                    child: _buildSearchBar(),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 180,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    items: items
                        .map(
                          (item) => SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              item,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  DotsIndicator(
                    dotsCount: items.length,
                    decorator: const DotsDecorator(
                      color: MyConstant.grey,
                      activeColor: MyConstant.primaryColor,
                      activeShape: StadiumBorder(),
                    ),
                    position: currentIndex,
                  ),
                  const SizedBox(height: MyConstant.defaultPadding),
                  UiSectionTile(
                      text: widget.isRes!
                          ? 'Shop by Cuisine'
                          : 'Shop by Category',
                      isTrailing: true,
                      trailing: "VIEW ALL"),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.isRes!
                          ? myResModel.length
                          : myHomeModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = widget.isRes!
                            ? myResModel.elementAt(index)
                            : myHomeModel.elementAt(index);
                        return _buildShopRow(data);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: MyConstant.defaultPadding / 2,
                        );
                      },
                    ),
                  ),
                  widget.isRes!
                      ? const UiSectionTile(
                          text: 'Top Rated Near You',
                        )
                      : const SizedBox(),
                  const SizedBox(height: MyConstant.defaultPadding),
                  widget.isRes! ? _buildTopRated() : _buildHomeDetails(),
                  const SizedBox(height: MyConstant.defaultPadding * 2),
                  widget.isRes!
                      ? UiSectionTile(
                          text: 'Vendor\'s',
                          trailing: "VIEW ALL",
                          isTrailing: true,
                          isOnTap: () {
                            NavByMe.push(
                                context,
                                const CommonItemView(
                                  isVendor: true,
                                ));
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: MyConstant.defaultPadding),
                          child: _buildDealOfDayTitle(),
                        ),
                  const SizedBox(height: MyConstant.defaultPadding * 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 300,
                      child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildDealOfDayContainer(index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: MyConstant.defaultPadding,
                          );
                        },
                      ),
                    ),
                  ),
                  UiSectionTile(
                      text: widget.isRes!
                          ? 'What\'s in your mind'
                          : "Order Again"),
                  const SizedBox(height: MyConstant.defaultPadding / 2),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      itemCount: widget.isRes!
                          ? resRowOneModel.length
                          : orderAgainRowOneModel.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var data = widget.isRes!
                            ? resRowOneModel.elementAt(index)
                            : orderAgainRowOneModel.elementAt(index);
                        return _buildOrderAgainGrid(data);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: MyConstant.defaultPadding,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: MyConstant.defaultPadding / 2),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      itemCount: widget.isRes!
                          ? resRowTwoModel.length
                          : orderAgainRowTwoModel.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var data = widget.isRes!
                            ? resRowTwoModel.elementAt(index)
                            : orderAgainRowTwoModel.elementAt(index);
                        return _buildOrderAgainGrid(data);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: MyConstant.defaultPadding,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: MyConstant.defaultPadding / 2),
                  SizedBox(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 180,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                      items: items
                          .map(
                            (item) => SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                item,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: MyConstant.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          _scaffoldState.currentState!.openDrawer();
        },
        child: Image.asset(
          "assets/menu.png",
          height: 65,
        ),
      ),
      title: ListTile(
        dense: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/appbar_icon.png",
            ),
            const Text(
              "A Block",
              style: MyTextStyles.blockText,
            ),
          ],
        ),
        subtitle: const Text(
          "Sector 63,Noida",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: MyConstant.myblack),
        ),
        trailing: IconButton(
          onPressed: () {
            NavByMe.push(context, const NotificationView());
          },
          icon: const Icon(
            Icons.notifications,
            color: MyConstant.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(MyConstant.defaultPadding * 2),
          bottomRight: Radius.circular(MyConstant.defaultPadding * 2),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(MyConstant.defaultPadding * 2),
                ),
                color: const Color(0XFFFFC700).withOpacity(0.27),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MyConstant.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: MyConstant.defaultPadding * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          child: Image.asset("assets/profile.png"),
                        ),
                        GestureDetector(
                          onTap: () {
                            NavByMe.pop(context);
                          },
                          child: Image.asset(
                            "assets/menu.png",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      userName ?? "",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C1F26)),
                    ),
                    Text(userPhone ?? ''),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MyConstant.defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding),
              child: Container(
                height: 73,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(MyConstant.defaultPadding),
                  color: MyConstant.primaryColor,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavByMe.push(context, const MyWalletView());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.account_balance_wallet,
                                color: MyConstant.white, size: 32),
                            Text("Wallet",
                                style: MyTextStyles.drawerContainerText,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavByMe.push(context, const OrderHistoryView());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.history,
                                color: MyConstant.white, size: 32),
                            Text("Order History",
                                style: MyTextStyles.drawerContainerText,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavByMe.push(context, const MyCartView());
                        },
                        child: Column(
                          // direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 25,
                              width: 35,
                              child: Image.asset("assets/cart.png"),
                            ),
                            const Text("My Cart",
                                style: MyTextStyles.drawerContainerText,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: navModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = navModel.elementAt(index);
                  return ListTile(
                    leading: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MyConstant.defaultPadding / 2),
                        color: MyConstant.primaryColor,
                      ),
                      child: SvgPicture.asset(
                        data.imgSrc,
                      ),
                    ),
                    onTap: () {
                      NavByMe.push(context, data.onTap ?? const SizedBox());
                    },
                    title: Text(
                      data.text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_outlined,
                      color: MyConstant.black,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding * 5),
              child: GestureDetector(
                onTap: () {
                  NavByMe.push(context, const SubscriptionView());
                },
                child: const Text(
                  "subscription",
                  style: MyTextStyles.drawerSecText,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MyConstant.defaultPadding * 5),
              child: Text(
                "Privacy & policy",
                style: MyTextStyles.drawerSecText,
              ),
            ),
            const SizedBox(height: MyConstant.defaultPadding * 2),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: MyConstant.defaultPadding),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences _sharedPreference =
                    await SharedPreferences.getInstance();
                _sharedPreference.setBool('isLogin', false);
                NavByMe.pushCompleteReplacement(context, LoginView());
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MyConstant.defaultPadding,
                    vertical: MyConstant.defaultPadding),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MyConstant.defaultPadding * 2),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(MyConstant.defaultPadding * 2),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(MyConstant.defaultPadding * 2),
                borderSide: const BorderSide(
                  color: MyConstant.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(MyConstant.defaultPadding * 2),
                borderSide: const BorderSide(
                  color: MyConstant.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(MyConstant.defaultPadding * 2),
                borderSide: const BorderSide(
                  color: MyConstant.grey,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic, color: MyConstant.primaryColor),
              hintText: "Search by Product or Restaurant",
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Color(0xFF7D7D7D))),
        ),
      ),
    );
  }

  Widget _buildHomeContainer(
      double height, double width, String text, String image, String offer) {
    return Material(
      elevation: 5.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(MyConstant.defaultPadding),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            const SizedBox(
              height: MyConstant.defaultPadding / 2,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(MyConstant.defaultPadding / 2),
                    bottomRight: Radius.circular(MyConstant.defaultPadding / 2),
                  ),
                  color: MyConstant.primaryColor),
              child: Center(
                child: Text(
                  "UP TO $offer OFF",
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: MyConstant.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopRow(MyModel data) {
    return GestureDetector(
      onTap: () {
        NavByMe.push(context, data.onTap ?? const SizedBox());
      },
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(data.imgSrc),
          ),
          const SizedBox(
            height: MyConstant.defaultPadding / 4,
          ),
          Text(
            data.text,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0XFF333333),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  _buildDealOfDayTitle() {
    return Row(
      children: const [
        Text(
          "Deal of the day",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0XFF1B1B1B),
          ),
        ),
        Icon(Icons.expand_more),
        Text(
          "(Today)",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        Spacer(),
        Text(
          "VIEW ALL",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: MyConstant.primaryColor),
        ),
      ],
    );
  }

  Widget _buildDealOfDayContainer(int index) {
    return Stack(
      children: [
        Container(
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
            border: Border.all(color: MyConstant.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 155,
                child: Image.asset(
                    index.isEven ? "assets/deal_01.png" : "assets/deal_02.png",
                    fit: BoxFit.fill),
              ),
              const SizedBox(
                height: MyConstant.defaultPadding,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Shah's Restaurant",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  "₹565.0",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: MyConstant.defaultPadding / 2,
                  ),
                  const Text(
                    "Shop",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                  Switch(
                    // thumb color (round icon)
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.red,

                    // boolean variable value
                    value: _switchValue,
                    // changes the state of the switch
                    onChanged: (value) => setState(() => _switchValue = value),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                  ),
                  const Icon(
                    Icons.history,
                    size: 18,
                  ),
                  const Text(
                    "45min",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
              const Text(
                "100+Items",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("4.2+"),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderAgainGrid(MyModel data) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
          border: Border.all(color: MyConstant.grey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 90,
              child: Image.asset(
                data.imgSrc,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: MyConstant.defaultPadding / 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: MyConstant.black),
                ),
                const SizedBox(
                  height: MyConstant.defaultPadding / 2,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.schedule,
                      size: 15,
                    ),
                    SizedBox(
                      width: MyConstant.defaultPadding / 4,
                    ),
                    Text(
                      "29 min",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: MyConstant.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MyConstant.defaultPadding / 2,
                ),
                const Text(
                  "sector , Noida",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0XFF000000),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: MyConstant.defaultPadding / 2,
            ),
          ],
        ),
      ),
    );
  }

  _buildHomeDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                NavByMe.push(
                    context,
                    const CommonItemView(
                      isVeg: true,
                    ));
              },
              child: _buildHomeContainer(150.0, 200.0, "Fruits & Vegetables",
                  "assets/home_fruit.png", "23%"),
            ),
            GestureDetector(
              onTap: () {
                NavByMe.push(context, const CommonItemView());
              },
              child: _buildHomeContainer(
                  150.0, 140.0, "Grocery", "assets/home_fruit.png", "23%"),
            ),
          ],
        ),
        const SizedBox(height: MyConstant.defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                NavByMe.push(
                    context,
                    const CommonItemView(
                      isRes: true,
                    ));
              },
              child: _buildHomeContainer(
                  150.0, 140.0, "Bakery", "assets/home_bakery.png", "23%"),
            ),
            GestureDetector(
              onTap: () {
                NavByMe.push(
                    context,
                    const CommonItemView(
                      isRes: true,
                    ));
              },
              child: _buildHomeContainer(
                  150.0, 200.0, "Food", "assets/home_food.png", "23%"),
            ),
          ],
        ),
      ],
    );
  }

  _buildTopRated() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: myResTopModel.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var data = myResTopModel.elementAt(index);
          return Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(MyConstant.defaultPadding / 2),
              image: DecorationImage(
                  image: AssetImage(
                    data.imgSrc,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                        color: Color(0xFFDF0707),
                      ),
                      child: const Center(
                        child: Text(
                          "FREE DELIVERY",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w300,
                              color: MyConstant.white),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      color: MyConstant.white,
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    data.text,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyConstant.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "20% OFF",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyConstant.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "29 Items",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyConstant.white),
                  ),
                ),
              ],
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
}
