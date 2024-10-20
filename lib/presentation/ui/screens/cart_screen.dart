import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';
import '../utils/app_color.dart';
import '../utils/assets_path.dart';
import '../widgets/cart/cart_item_widget.dart';
import '../widgets/item_count_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title:const Text('Cart') ,
          leading: IconButton(
            onPressed: (){

              BackToHome();

            },icon: const Icon(

              Icons.arrow_back_ios_outlined),)

      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
      itemCount: 3,

      itemBuilder:(context,index) {
            return CartItemWidget();


    },),

          ) ,

        Container(

          child: _buildPriceAndAddToCartSection(),
        ),



        ],


      ),

    );
  }

  void BackToHome(){

    Get.find<BottomNavBarController>().BackToHome();
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColor.themecolor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8)
          )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Price"),
              Text("\$10000",style:  TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.themecolor),
              ),],
          ),
          SizedBox(
              width: 140,

              child: ElevatedButton(onPressed: (){}, child: const Text("Check Out",style: TextStyle(color: Colors.white),)))
        ],
      ),
    );
  }

}


