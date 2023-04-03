import 'package:flutter/material.dart';

import 'package:food_app/colors/const_colors.dart';
import 'package:food_app/bottom/bottom_navigator.dart';
import 'package:food_app/models/onboard_model.dart';

class OnBoardScreen1 extends StatefulWidget {
  const OnBoardScreen1({super.key});

  @override
  State<OnBoardScreen1> createState() => _OnBoardScreen1State();
}

class _OnBoardScreen1State extends State<OnBoardScreen1> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  FadeInAnimation(
                    durationIntMs: 250,
                    animationPosition: AnimationPosition(
                      topAfter: -100,
                      topBefore: -200,
                      leftAfter: -150,
                      leftBefore: -150,
                    ),
                    child: Image.asset(
                      onboards[index].image,
                      width: 600,
                      height: 600,
                      fit: BoxFit.contain,
                    ),
                  ),
                  FadeInAnimation(
                      durationIntMs: 250,
                      animationPosition: AnimationPosition(
                        topAfter: 350,
                        topBefore: 450,
                        leftAfter: 25,
                        leftBefore: 25,
                      ),
                      child: Text(
                        onboards[index].title,
                        style: roboto.copyWith(
                            color: white, fontSize: 45, height: 1.3),
                      )),
                  FadeInAnimation(
                      durationIntMs: 250,
                      animationPosition: AnimationPosition(
                        topAfter: 470,
                        topBefore: 600,
                        leftAfter: 25,
                        leftBefore: 25,
                      ),
                      child: Text(
                        onboards[index].subtitle,
                        style: roboto.copyWith(
                            color: white, fontSize: 24, height: 1.3),
                      )),
                  FadeInAnimation(
                    animationPosition: AnimationPosition(
                      topAfter: 570,
                      topBefore: 620,
                      leftAfter: 25,
                      leftBefore: 25,
                    ),
                    child: Row(
                      children: [
                        ...List.generate(
                            onboards.length,
                            (index) => AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  height: 5,
                                  width: 50,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: currentPage == index
                                        ? orange
                                        : white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                      ],
                    ),
                    durationIntMs: 250,
                  ),
                ],
              );
            },
          ),
          FadeInAnimation(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigator(),
                      ));
                },
                color: orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 72,
                minWidth: MediaQuery.of(context).size.width - 50,
                child: Text(
                  'Get Started',
                  style: roboto.copyWith(
                    color: white,
                    fontSize: 24,
                  ),
                ),
              ),
              durationIntMs: 250,
              animationPosition: AnimationPosition(
                bottomAfter: 20,
                bottomBefore: -80,
              ))
        ],
      ),
    );
  }
}

class AnimationPosition {
  final double? topBefore,
      topAfter,
      leftBefore,
      leftAfter,
      bottomBefore,
      bottomAfter,
      rightBefore,
      rightAfter;

  AnimationPosition({
    this.topBefore,
    this.topAfter,
    this.leftBefore,
    this.leftAfter,
    this.bottomBefore,
    this.bottomAfter,
    this.rightBefore,
    this.rightAfter,
  });
}

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int durationIntMs;
  final AnimationPosition animationPosition;

  const FadeInAnimation({
    Key? key,
    required this.child,
    required this.durationIntMs,
    required this.animationPosition,
  }) : super(key: key);

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  bool? animated;

  @override
  void initState() {
    super.initState();
    changeAnimation();
  }

  Future changeAnimation() async {
    animated = false;
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      setState(() {
        animated = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.durationIntMs),
      top: animated!
          ? widget.animationPosition.topAfter
          : widget.animationPosition.topBefore,
      left: animated!
          ? widget.animationPosition.leftAfter
          : widget.animationPosition.leftBefore,
      right: animated!
          ? widget.animationPosition.rightAfter
          : widget.animationPosition.rightBefore,
      bottom: animated!
          ? widget.animationPosition.bottomAfter
          : widget.animationPosition.bottomBefore,
      child: widget.child,
    );
  }
}
