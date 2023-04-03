import '../models/poduct_model.dart';

class CartModel {
  final ProductModel productModel;
  int quantity;

  CartModel({required this.productModel, required this.quantity});
}
