import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors/const_colors.dart';
import '../models/cart_model.dart';
import '../provider/cart_provider.dart';

class CartItemDetails extends StatelessWidget {
  final CartModel cart;
  CartItemDetails({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 150,
      child: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
            ),
          ),
          Transform.rotate(
            angle: 10 * pi / 180,
            child: Stack(
              //alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  bottom: 15,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 10),
                        blurRadius: 30,
                        spreadRadius: 10,
                        color: black.withOpacity(0.1),
                      ),
                    ]),
                    child: Image.network(
                      cart.productModel.image,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                cart.productModel.name,
                style: roboto.copyWith(
                  fontSize: 18,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 100,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 22,
                            color: yellow,
                          ),
                          Text(
                            cart.productModel.rate.toString(),
                            style: roboto.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: liteOrange,
                          size: 20,
                        ),
                        Text(cart.productModel.location.toString()),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 115),
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            '\$${cart.productModel.price.toString()}',
                            style: roboto.copyWith(
                              fontSize: 22,
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (cart.quantity > 1) {
                            cartProvider.reduceQuantity(cart.productModel);
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 25,
                          decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              )),
                          child: Icon(
                            Icons.remove,
                            color: white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        cart.quantity.toString(),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          cartProvider.addCart(cart.productModel);
                        },
                        child: Container(
                          height: 35,
                          width: 25,
                          decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              )),
                          child: Icon(
                            Icons.add,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
