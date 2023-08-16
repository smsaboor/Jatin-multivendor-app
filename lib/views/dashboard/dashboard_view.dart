import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/cart/my_cart.dart';
import 'package:multivendor_app/views/home/home.dart';
import 'package:multivendor_app/views/wallet/wallet.dart';

import '../profile/profile_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const MyCartView(),
    const MyWalletView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        selectedIndex = index;
      });
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: MyConstant.primaryColor,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.home_rounded),
                icon: Icon(Icons.home_outlined),
                label: ("Home"),
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart_rounded),
                icon: Icon(Icons.shopping_cart_outlined),
                label: ("Cart"),
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.wallet_rounded),
                icon: Icon(Icons.wallet_outlined),
                label: ("Wallet"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/profile.png",
                ),
                label: (""),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            iconSize: 27,
            selectedItemColor: MyConstant.white,
            unselectedItemColor: MyConstant.white,
            onTap: _onItemTapped,
            elevation: 10,
          ),
        ),
      ),
    );
  }
}
