import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/icons/resource.png',
      selectedImagePath: 'assets/icons/resource_s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/search.png',
      selectedImagePath: 'assets/icons/search_s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/menu.png',
      selectedImagePath: 'assets/icons/menu_s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/user.png',
      selectedImagePath: 'assets/icons/user_s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
