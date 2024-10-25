
import 'package:crafty_bay/presentation/state_holders/product_list_by_catagory_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Data/models/catagory_model.dart';







class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key,   required this.catagory});

  final  CatagoryModel catagory;



  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  void initState() {
    super.initState();

    Get.find<ProductListByCatagoryController>().getProductListByCatagory(widget.catagory.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.catagory.categoryName ?? '') ,

      ),
      body: GetBuilder<ProductListByCatagoryController>(
        builder: (productListByCatagoryController) {

          if(productListByCatagoryController.inProgress){
            return CenteredCircularProgressIndicator();
          }
          if(productListByCatagoryController.errorMessage!= null){
            return Center(

              child: Text(productListByCatagoryController.errorMessage!),
            );
          }

          if(productListByCatagoryController.productList.isEmpty){
            return Center(

              child: Text('Empty Product list'),
            );
          }
          return GridView.builder(
              padding: const EdgeInsets.all(10),

            itemCount: Get.find<ProductListByCatagoryController>().productList.length,

              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(

             crossAxisCount: 3,
             childAspectRatio: 1,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4
          ),


              itemBuilder: (context,index){
                return FittedBox(child: ProductCard(product: productListByCatagoryController.productList[index]));

                // return const ProductCard();
              });
        }
      ),
    );
  }
}
