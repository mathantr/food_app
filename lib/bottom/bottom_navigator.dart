import 'package:flutter/material.dart';
import 'package:food_app/Screens/home/home_screen.dart';
import 'package:food_app/colors/const_colors.dart';
import 'package:food_app/models/bottom_icons_model.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentPage) {
        case 0:
          return HomeScreen();
        case 1:
          return Center(
            child: Text('Chat'),
          );
        case 2:
          return Center(
            child: Text('Explore'),
          );
        case 3:
          return Center(
            child: Text('Profile'),
          );
        default:
          return Center(
            child: Text('Something Went Wrong'),
          );
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: body(),
      bottomNavigationBar: Container(
        height: 86,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
                bottomIcons.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            currentPage == index
                                ? bottomIcons[index].selected
                                : bottomIcons[index].unSelected,
                            color: black,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                                color: black, shape: BoxShape.circle),
                            width: currentPage == index ? 7 : 0,
                            height: currentPage == index ? 7 : 0,
                          )
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
