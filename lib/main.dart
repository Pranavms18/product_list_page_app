import 'package:flutter/material.dart';
import 'package:product_list_page_app/controller/product_list_screen_controller.dart';
import 'package:product_list_page_app/view/bottam_navbar_screen/bottam_navbar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductListScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottamnavbarScreen(),
      ),
    );
  }
}
