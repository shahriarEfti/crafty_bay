import 'package:crafty_bay/Data/models/product_model.dart';

class CartModel {
  int? id;
  int? productId; // ID of the product
  String? color; // Selected color of the product
  String? size; // Selected size of the product
  int? quantity; // Quantity of the product in the cart
  ProductModel? product; // Product details

  CartModel({
    this.id,
    this.productId,
    this.color,
    this.size,
    this.quantity,
    this.product,
  });

  // Factory constructor to create a CartModel from JSON
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    quantity = json['qty'];
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }



  }

