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
          backgroundColor: Colors.black,
          currentIndex: selectedTab,
          onTap: (value) {
            selectedTab = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.window_rounded,
                  size: 30,
                ),
                label: "",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_line_spacing_rounded,
                  size: 30,
                ),
                label: "",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: "",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "",
                backgroundColor: Colors.white),
          ]),
    );
  }
}
