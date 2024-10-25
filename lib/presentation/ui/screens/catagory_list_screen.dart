import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/catagory_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/catagory_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoryListScreen extends StatelessWidget {
  const CatagoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        BackToHome();

      },
      child: Scaffold(

        appBar: AppBar(
            title: Text('Catagories'),

            leading: IconButton(
              onPressed: (){

                BackToHome();

              },icon: Icon(

                Icons.arrow_back_ios_outlined),)
        ),
        body: GridView.builder(
            itemCount: Get.find<CatagoryListController>().catagoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,childAspectRatio: 0.75
            ),
            itemBuilder: (context,index)
            { return CatagoryCard(catagoryModel: Get.find<CatagoryListController>().catagoryList[index],);
            }),

      ),
    );
  }
  void BackToHome(){

    Get.find<BottomNavBarController>().BackToHome();
  }
}