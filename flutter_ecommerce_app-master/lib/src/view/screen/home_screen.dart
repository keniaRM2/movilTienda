import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/view/widget/page_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  List<Widget> screens = [const ProductListScreen()];

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: newIndex,
          items: AppData.bottomNavyBarItems
              .where((item) => item.visible == true)
              .map(
                (item) => BottomNavyBarItem(
                  icon: item.icon,
                  title: Text(item.title),
                  activeColor: item.activeColor,
                  inactiveColor: item.inActiveColor,
                ),
              )
              .toList(),
          onItemSelected: (currentIndex) {
            newIndex = currentIndex;
            screens = [
               AppData.bottomNavyBarItems
              .where((item) => item.visible == true).toList()[newIndex].widget
            ];
            // for (var i = 0; i < AppData.bottomNavyBarItems.length; i++) {
            //   if (AppData.bottomNavyBarItems[i].visible == true) {
            //     screens = [AppData.bottomNavyBarItems[newIndex].widget];
            //     break;
            //   }
            // }
            setState(() {});
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[0],
        ),
      ),
    );
  }
}
