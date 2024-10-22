import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/models/catagory_model.dart';
import '../utils/app_color.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key, required this.catagoryModel,
  });
  final CatagoryModel catagoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Get.to(()=> ProductListScreen(CatagoryName: catagoryModel.categoryName ?? ''));
      },
      child: Column(
        children: [
          Container(
            padding:const EdgeInsets.all(16),
            decoration:BoxDecoration(
                color: AppColor.themecolor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)

            ),

            child: const Icon(Icons.computer,size: 48,color: AppColor.themecolor,),
          ),
          const SizedBox(height: 4,),
           Text(catagoryModel.categoryName ?? '',style: TextStyle(
              color: AppColor.themecolor
          ),)
        ],
      ),
    );
  }
}