// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:finance/screens/activities.dart';
import 'package:finance/fragments/categories.dart';
import 'package:finance/fragments/color.dart';
import 'package:finance/fragments/main_stack.dart';
import 'package:finance/fragments/menu.dart';
import 'package:finance/fragments/subscription_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              title: const Text('Dashboard'),
              centerTitle: true,
              leading: Icon(Icons.account_circle),
              actions: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : _selectedIndex == 1
              ? AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                  title: const Text('Account Activities'),
                  centerTitle: true,
                )
              : _selectedIndex == 2
                  ? AppBar(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      title: const Text('Menu'),
                      centerTitle: true,
                    )
                  : null,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Page 1
          Center(
            child: Column(
              children: [
                MainStack(),
                SizedBox(height: 80),
                Divider(),
                SizedBox(height: 10),
                CategoriesWidget(),
                SubscriptionContainer(),
              ],
            ),
          ),
          // Page 2
          ActivityPage(),
          // Page 3
          SingleChildScrollView(
            child: Column(
              children: [
                MenuPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        labels: ["Home", "Activity", "Menu"],
        icons: [Icons.home, Icons.timelapse, Icons.menu],
        initialSelectedTab: "Home",
        tabBarColor: AppColors.primaryColor,
        tabIconColor: Colors.white,
        tabSelectedColor: Colors.red,
        textStyle: TextStyle(color: Colors.white),
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 1000),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}
