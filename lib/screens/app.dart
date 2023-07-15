// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_damex/screens/nav_screens/cart.dart';
import 'package:ecommerce_damex/screens/nav_screens/home.dart';
import 'package:ecommerce_damex/screens/nav_screens/wallet.dart';
import 'package:ecommerce_damex/screens/nav_screens/whitelist.dart';
import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:ecommerce_damex/screens/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLayout extends StatefulWidget {
  AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Container(
                  width: 45,
                  height: 45,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: SvgPicture.asset('images/icons/menu.svg'),
                ), // Replace with your desired icon
                onPressed: () => Scaffold.of(context).openDrawer());
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('images/icons/bag.svg',
                colorFilter: ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
            style: IconButton.styleFrom(backgroundColor: lightGreyColor),
          ),
          SizedBox(width: 5)
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomePage(),
          WhiteList(),
          Cart(),
          Wallet(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/icons/home.svg'),
            activeIcon: Text('Home', style: TextStyle(color: primaryColor)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/icons/heart.svg'),
            activeIcon:
                Text('Whitelist', style: TextStyle(color: primaryColor)),
            label: "Whitelist",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/icons/bag.svg'),
            activeIcon: Text('Cart', style: TextStyle(color: primaryColor)),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/icons/wallet.svg'),
            activeIcon: Text('Wallet', style: TextStyle(color: primaryColor)),
            label: "Wallet",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
      drawer: AppDrawer(),
    );
  }
}
