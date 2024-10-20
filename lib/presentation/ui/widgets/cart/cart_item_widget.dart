

import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/assets_path.dart';
import '../item_count_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        children: [
          _buildProductImage(),


          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(

                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,

                        children: [

                          Text("Title of the product",style: textTheme.bodyLarge,),
                          const SizedBox(height: 8),

                          _buildColorAndSize(textTheme)

                        ],
                      ),
                    ),

                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.grey,))

                  ],
                ),

                _buildPriceAndCounter( textTheme),

              ],
            ),
          )
        ],
      ),


    );
  }

  Wrap _buildColorAndSize(TextTheme textTheme) {
    return Wrap(
                            spacing: 8,

                            children:[ Text("Color:Red",style: textTheme.bodySmall?.copyWith(color: Colors.grey)),

                              Text("Size: XL",style: textTheme.bodySmall?.copyWith(color: Colors.grey,)
                              ),]);
  }

  Widget _buildPriceAndCounter(TextTheme textTheme) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("\$1000",style:  TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.themecolor),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ItemCount(
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 10,
                      decimalPlaces: 0,
                      color: AppColor.themecolor,
                      onChanged: (value) {
                        // Handle counter value changes
                        print('Selected value: $value');
                      },
                    ),
                  ),


                ],
              );
  }

  Widget _buildProductImage() {
    return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(AssetsPath.dummyproductimg,
            height: 90,
            width: 90,
            fit: BoxFit.scaleDown,),
        );
  }
}