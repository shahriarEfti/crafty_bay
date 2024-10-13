import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index){
        return ProductCard();
      }, separatorBuilder: (_, __)=>SizedBox(
      width: 8,
    ),


    );
  }
}
