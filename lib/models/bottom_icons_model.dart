import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIcon {
  final IconData selected, unSelected;
  BottomIcon({
    required this.selected,
    required this.unSelected,
  });
}

List<BottomIcon> bottomIcons = [
  BottomIcon(selected: Icons.home_filled, unSelected: Icons.home_outlined),
  BottomIcon(
      selected: CupertinoIcons.chat_bubble_text_fill,
      unSelected: CupertinoIcons.chat_bubble_text),
  BottomIcon(
      selected: CupertinoIcons.compass_fill,
      unSelected: CupertinoIcons.compass),
  BottomIcon(
      selected: Icons.person_rounded, unSelected: Icons.person_outline_rounded),
];
