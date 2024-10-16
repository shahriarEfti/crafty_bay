import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/catagory_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final BottomNavBarController _navBarController = Get.find <BottomNavBarController>();

  final List<Widget> _screens=[
    HomeScreen(),
    CatagoryListScreen(),
   CartScreen(),
    WishListScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (_) {
        return Scaffold(
          body: _screens
            [_navBarController.selectedIndex]

          ,
          bottomNavigationBar: NavigationBar(
            selectedIndex: _navBarController.selectedIndex,
            onDestinationSelected: _navBarController.changedIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Catagory'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.favorite), label: 'WishList'),
            ],
          ),

        );
      }
    );
  }
}
