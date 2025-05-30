import 'package:flutter/material.dart';
import 'package:product_list_page_app/view/account_screen/account_screen.dart';
import 'package:product_list_page_app/view/cart_screen/cart_screen.dart';
import 'package:product_list_page_app/view/fav_screen/fav_screen.dart';
import 'package:product_list_page_app/view/info_screen/info_screen.dart';
import 'package:product_list_page_app/view/product_list_screen/product_list_screen.dart';

class BottamnavbarScreen extends StatefulWidget {
  const BottamnavbarScreen({super.key});

  @override
  State<BottamnavbarScreen> createState() => _BottamnavbarScreenState();
}

class _BottamnavbarScreenState extends State<BottamnavbarScreen> {
  int selectedTab = 0;
  List screens = [
    ProductListScreen(),
    InfoScreen(),
    CartScreen(),
    FavScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (value) {
            selectedTab = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: "Home",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.restaurant_menu_sharp,
                  size: 30,
                ),
                label: "Menu",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Sign in",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: "Cart",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_outlined),
                label: "More",
                backgroundColor: Colors.red),
          ]),
    );
  }
}
