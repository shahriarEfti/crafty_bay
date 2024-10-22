import 'package:crafty_bay/Data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key, required this.productList,
  });

  final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productList.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index){
        return ProductCard(
          product: productList[index],

        );
      }, separatorBuilder: (_, __)=>SizedBox(
      width: 8,
    ),


    );
  }
}
