import 'package:flutter/material.dart';
import 'package:food_apps/controllers/navigation.controller.dart';
import 'package:food_apps/controllers/theme_controller.dart';
import 'package:food_apps/views/account_screen.dart';
import 'package:food_apps/views/home_screen.dart';
import 'package:food_apps/views/shopping_screen.dart';
import 'package:food_apps/views/widgets/custom_bottom_navbar.dart';
import 'package:food_apps/views/wishlist_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
