import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.CatagoryName});

  final String CatagoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(CatagoryName) ,

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

             return const ProductCard();
          }),
    );
  }
}
