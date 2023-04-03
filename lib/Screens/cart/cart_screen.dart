// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/cart_item_details.dart';
import 'package:provider/provider.dart';

import 'package:food_app/colors/const_colors.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: black.withOpacity(0.4))),
              child: Icon(
                Icons.arrow_back,
                color: black,
                size: 25,
              ),
            ),
          ),
        ),
        title: Text(
          'My Cart',
          style: poppins.copyWith(
              fontWeight: FontWeight.w600, fontSize: 18, color: black),
        ),
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                          carts.length,
                          (index) => FadeInUp(
                              duration: Duration(milliseconds: 500),
                              child: CartItemDetails(cart: carts[index])))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Delivery',
                          style: roboto.copyWith(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: DottedLine(
                          dashLength: 7,
                          dashColor: black.withOpacity(0.3),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$05.99',
                          style: roboto.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: orange),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Order',
                          style: roboto.copyWith(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: DottedLine(
                          dashLength: 7,
                          dashColor: black.withOpacity(0.3),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$${(cartProvider.totalCart() + 5.99).toStringAsFixed(2)}',
                          style: roboto.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: orange),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: black),
                      child: Center(
                        child: Text(
                          'Pay ${(cartProvider.totalCart() + 5.99).toStringAsFixed(2)}',
                          style: roboto.copyWith(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
