import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/color_picker.dart';
import '../widgets/item_count_widget.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
          children: [
            Expanded(
              child:
                _buildProductDetails(context)


            
            ),
            _buildPriceAndAddToCartSection()
          ],

        ),


    );}

  Widget _buildProductDetails(BuildContext context) {
    return SingleChildScrollView(
                child: Column(
                  children: [
                     const ProductImageBannerSlider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNameAndQuantitySection(context),
                          const SizedBox(width: 4,),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,

                            children: [

                            _buildRatingAndReviewSection(),
                              Card(
                                color: AppColor.themecolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: const Padding(

                                  padding: EdgeInsets.all(4.0),

                                  child: Icon(Icons.favorite_border_outlined,size: 16,color: Colors.white,),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 8,),
                          ColorPicker(colors: const [

                            Colors.red,
                            Colors.blueGrey,
                            Colors.brown,
                            Colors.black,

                          ], onColorSelected:( color){},),

                          const SizedBox(width: 16,),
                          SizePicker(
                            sizes: const [
                              "S",
                              "M",
                              "L",
                              "XL",
                              "XXL"
                            ],


                                onSizeSelected: (String selectedSize ) {  },),

                          const SizedBox(height: 16,),
                          _buildDescriptionSection(context)
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description",style: Theme.of(context).textTheme.titleMedium,),
                            const SizedBox(height: 8,),

                            const Text('''Designed for walking in ultimate comfort,the Nike Motiva provides our highest level of cushioning.A tall foam stack combines with our Comfortgroove innovation on the outsole to absorb the bumps along the way.And its exaggerated rocker helps propel you forward.'''
                            ,style: TextStyle(color: Colors.black54),),
                          ],
                        );
  }

Widget _buildNameAndQuantitySection(BuildContext context) {
    return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text("Nike Shoes Latest Model 2024- New year special Deal",style: Theme.of(context).textTheme.titleMedium,)),
                            ItemCount(
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
                          ],
                        );
  }

  Widget _buildRatingAndReviewSection() {
    return Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(Icons.star,color: Colors.amber,),
                                const Text('4.8',style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                                const SizedBox(width: 8,),
                                TextButton(
                                  onPressed: () {
                                    Get.to(()=>ReviewScreen());
                                  },
                                  child: const Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.themecolor, // Use your defined theme color here
                                    ),
                                  ),
                                ),


                              ],
                            );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
            padding: const EdgeInsets.all(8),
           decoration: BoxDecoration(
             color: AppColor.themecolor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8)
            )
           ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price"),
                    Text("\$1000",style:  TextStyle(fontSize: 18,
  fontWeight: FontWeight.w600,
  color: AppColor.themecolor),
                    ),],
                ),
                SizedBox(
                  width: 140,

                    child: ElevatedButton(onPressed: (){}, child: const Text("Add To Cart",style: TextStyle(color: Colors.white),)))
              ],
            ),
          );
  }

}


