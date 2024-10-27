import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/payment_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../widgets/cart/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const CartItemWidget();
                },
              ),
            ),
            _buildPriceAndAddToCartSection()
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColor.themecolor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price'),
              Text(
                '\$10000',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.themecolor),
              )
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: _onTapCheckOutButton,
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onTapCheckOutButton() {
    Get.to(() => const PaymentDetailsScreen());
  }

  void backToHome() {
    Get.find<BottomNavBarController>().BackToHome();
  }
}