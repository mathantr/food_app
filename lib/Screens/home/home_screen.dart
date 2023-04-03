// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/cart/cart_screen.dart';

import 'package:food_app/colors/const_colors.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/poduct_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCatPage = 0;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Your Location',
                            style: roboto.copyWith(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'India, Tamil Nadu',
                            style: roboto.copyWith(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: black.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                        ),
                        child: Icon(
                          Icons.search,
                          color: black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: black.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: white,
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: black,
                            ),
                          ),
                          cartProvider.carts.isNotEmpty
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CartScreen(),
                                          ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: liteOrange,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 8,
                                                spreadRadius: 1,
                                                color: liteOrange,
                                                offset: Offset(-2, 5))
                                          ]),
                                      child: Text(
                                        cartProvider.carts.length.toString(),
                                        style: roboto.copyWith(
                                          color: white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Let\'s Find the best\nfood around you',
                style: poppins.copyWith(
                    fontSize: 28,
                    color: black,
                    fontWeight: FontWeight.w700,
                    height: 1.3),
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Find by Category',
                    style: poppins.copyWith(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See All',
                    style: roboto.copyWith(
                        color: orange,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      categories.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentCatPage = index;
                                // print(currentCatPage = index);
                              });
                            },
                            child: CategoryList(
                              selected: currentCatPage == index,
                              categoryList: categories[index],
                            ),
                          )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Results (${productModel.length})',
                style: poppins.copyWith(
                    fontSize: 14,
                    color: black.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(
                      productModel.length,
                      (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 10, right: 15)
                            : const EdgeInsets.only(right: 20),
                        child: ProductList(product: productModel[index]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final ProductModel product;

  const ProductList({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProduct = Provider.of<CartProvider>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 225,
          width: MediaQuery.of(context).size.width / 2 - 35,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
        ),
        Container(
          height: 275,
          width: MediaQuery.of(context).size.width / 2 - 35,
          decoration: BoxDecoration(
              color: transparent, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.rotate(
                angle: 10 * pi / 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: black.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 10)
                      ]),
                    ),
                    Image.network(
                      product.image,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  product.name,
                  style: roboto.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yellow,
                        size: 20,
                      ),
                      Text(product.rate.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: pink,
                      ),
                      Text(product.location.toString())
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  '\$${product.price.toString()}',
                  style: roboto.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                cartProduct.addCart(product);
              },
              child: Container(
                height: 43,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: black),
                child: Icon(
                  Icons.shopping_cart,
                  color: white,
                ),
              ),
            ))
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  final bool selected;
  final Category categoryList;
  const CategoryList({
    Key? key,
    required this.selected,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 105,
      width: 78,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: selected
              ? Border.all(
                  width: 3,
                  color: orange,
                )
              : Border.all(color: white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 40,
                width: 36,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      color: black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 6)
                ]),
              ),
              Image.network(
                categoryList.image,
                width: 46,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            categoryList.name,
            style: roboto.copyWith(
                fontSize: 12, color: black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
