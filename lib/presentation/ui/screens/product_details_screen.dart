import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/models/product_details_model.dart';
import '../../state_holders/auth_controller.dart';
import '../../state_holders/product_details_by_id_controller.dart';
import '../utils/snack_message.dart';
import '../widgets/color_picker.dart';
import '../widgets/item_count_widget.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _selectedColor ='';
  String _selectedSize ='';
  int quantity =1;
  @override
  void initState() {
    super.initState();
    Get.find<ProductdetailsByIdController>()
        .getProductdetailsById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetBuilder<ProductdetailsByIdController>(
        builder: (productDetailsByIdController) {
          if (productDetailsByIdController.inProgress) {
            return const CenteredCircularProgressIndicator();
          }
          if (productDetailsByIdController.errorMessage != null) {
            return Center(
              child: Text(productDetailsByIdController.errorMessage!),
            );
          }
          final product = productDetailsByIdController.product;
          if (product == null) {
            return const Center(child: Text("Product details not available"));
          }
          return Column(
            children: [
              Expanded(
                child: _buildProductDetails(
                  product),
              ),
              _buildPriceAndAddToCartSection(product),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductDetails(ProductDetailsModel product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageBannerSlider(
            sliderUrls: [
              product.img1!,
              product.img2!,
              product.img3!,
              product.img4!,

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(product),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildRatingAndReviewSection(product),
                    Card(
                      color: AppColor.themecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ColorPicker(
                  colors: _parseColorOptions(product.color), // Dynamically parsed colors from product.color
                  onColorSelected: (color) {
                    setState(() {
                      _selectedColor = color.toString(); // Convert color to string if needed
                    });
                  },
                ),

                const SizedBox(height: 16),
                SizePicker(
                  sizes: product.size?.split(',') ?? [],
                  onSizeSelected: (String selectedSize) {
                    _selectedSize =selectedSize;
                  },
                ),
                const SizedBox(height: 16),
                _buildDescriptionSection(product),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description' ,
          style:   Theme.of(context).textTheme.titleMedium),


        const SizedBox(height: 8),

        Text(
          productDetails.product?.shortDes ?? '',
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productDetails) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            productDetails.product?.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ItemCount(
          initialValue: quantity,
          minValue: 1,
          maxValue: 10,
          decimalPlaces: 0,
          color: AppColor.themecolor,
          onChanged: (value) {
           quantity = value.toInt();
          },
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber),
        Text(
        '  ${productDetails.product?.star ?? ''}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Get.to(() => ReviewScreen());
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

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.themecolor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              Text(
                '\$${productDetails.product?.price ?? ''}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.themecolor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                return Visibility(
                  visible: !addToCartController.inProgress,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _onTapAddToCart,
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
  // Helper method to parse color options from the product's color string
  List<Color> _parseColorOptions(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return [Colors.black]; // Default color if none provided
    }

    List<Color> colorList = [];
    List<String> colorStrings = colorString.split(',');

    for (var color in colorStrings) {
      switch (color.trim().toLowerCase()) {
        case 'red':
          colorList.add(Colors.red);
          break;
        case 'green':
          colorList.add(Colors.green);
          break;
        case 'white':
          colorList.add(Colors.white);
          break;
      // Add more cases as needed
        default:
          colorList.add(Colors.black); // Fallback color
      }
    }

    return colorList;
  }

  Future<void> _onTapAddToCart() async {

   bool isLoggedInUser = await Get.find<AuthController>().isLoggedInUser();
    if(isLoggedInUser){
     AuthController.accessToken;
   final result = await Get.find<AddToCartController>().addToCart(
        widget.productId,
        _selectedColor,
        _selectedSize,
        quantity);
   if(result){
     if (mounted) {
       showSnackBarMessage(
           context,
           'Verification failed');

           }
   }else{
           if (mounted) {
           showSnackBarMessage(
           context,
               Get.find<AddToCartController>().errorMessage!, true);

           }
   }

    }else {

      Get.to(()=>const EmailVerificationScreen());
    }

  }

}
