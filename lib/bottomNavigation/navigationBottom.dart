import 'package:bbu_exam/Cart/cart.dart';
import 'package:bbu_exam/screen/e-commerce-home-3.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;

  final _items = [
    SalomonBottomBarItem(icon: const Icon(Icons.home), title: const Text("Home"),selectedColor: Colors.black),
    SalomonBottomBarItem(icon: const Icon(Icons.favorite_border_outlined), title: const Text("Favorite"),selectedColor: Colors.black),
    SalomonBottomBarItem(icon: const Icon(Icons.shopping_bag_outlined), title: const Text("Shopping"),selectedColor: Colors.black),
    SalomonBottomBarItem(icon: const Icon(Icons.person), title: const Text("Profile"),selectedColor: Colors.black)
  ];

  final _screen = [
    Center(child: const MyEcommerce3()),
    Center(child: Text('Favorite', style: TextStyle(fontSize: 30),),),
    Center(child: const MyCart()),
    Center(child: Text('Setting', style: TextStyle(fontSize: 30),),)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: _screen[_currentIndex],
    bottomNavigationBar:  SalomonBottomBar(items:_items,currentIndex: _currentIndex,onTap: (index) => setState(() {
      _currentIndex = index;
    }),),
    );

  }
}
