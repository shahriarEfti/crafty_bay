import 'package:crafty_bay/Data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductDetailsScreen(productId: product.id!,));
      },
      child: Card(
        elevation: 3,
        child: SizedBox(
         width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 160,
                padding:const EdgeInsets.all(16),
                decoration:BoxDecoration(
                    color: AppColor.themecolor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)
                    ),
                    image:  DecorationImage(image:NetworkImage(product.image ?? ''),
                        fit: BoxFit.scaleDown
                    )

                ),
              ),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(product.title ?? '',maxLines: 1,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                          Text(
                             
                               ' \$${product.price}',style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 color: AppColor.themecolor
                             )
                                                     ),


                         Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('${product.star}',style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),


                          ],
                        ),
                        Card(
                          color: AppColor.themecolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(()=>WishListScreen());

                              },
                              child: const Icon(
                                Icons.favorite_border_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )


                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}