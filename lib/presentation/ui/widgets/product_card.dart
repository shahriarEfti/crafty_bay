import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 100,
              padding:EdgeInsets.all(16),
              decoration:BoxDecoration(
                  color: AppColor.themecolor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)
                  ),
                  image: DecorationImage(image: AssetImage(AssetsPath.dummyproductimg,),
                      fit: BoxFit.scaleDown
                  )

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name",maxLines: 1,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColor.themecolor
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$120'),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.star,color: Colors.amber,),
                          Text('3',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54)),


                        ],
                      ),
                      Card(
                        color: AppColor.themecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Padding(

                          padding: const EdgeInsets.all(4.0),

                          child: Icon(Icons.favorite_border_outlined,size: 16,color: Colors.white,),
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
    );
  }
}