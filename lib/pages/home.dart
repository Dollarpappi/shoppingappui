import 'package:eazi_shoppin/pages/cart_page.dart';
import 'package:eazi_shoppin/widgets/product_home_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  
  @override
  Widget build(BuildContext context) {
     List<Widget> pages =[
      const ProductHomeList(),
      const CartPage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0 ,
         currentIndex: currentPage,
        onTap: (value) {
         setState(() {
          currentPage = value;
         });
        },
       
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ""),
              BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "")
        ]),
        //index stack maintains the current state of the page when ur want to navigate to another
      body: IndexedStack(
        index: currentPage,
        children: pages,
      )
      );
  }
}