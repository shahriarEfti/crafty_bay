import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';
import '../widgets/product_card.dart';
import 'package:flutter/widgets.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
    onPopInvoked: (value){
      BackToHome();

    },
      child: Scaffold(
        appBar: AppBar(
          title:Text('WishList') ,
            leading: IconButton(
              onPressed: (){

                BackToHome();

              },icon: Icon(

                Icons.arrow_back_ios_outlined),)

        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),

            itemCount: 20,

            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 3,
                childAspectRatio: 0.5,
                mainAxisExtent: 200,
                crossAxisSpacing: 8
            ),


            itemBuilder: (context,index){

             // return const ProductCard();
            }),
      ),
    );
  }

  void BackToHome(){

    Get.find<BottomNavBarController>().BackToHome();
  }
  
}
