import 'package:flutter/material.dart';
import 'package:food_apps/controllers/theme_controller.dart';
import 'package:food_apps/views/all_food_screen.dart';
import 'package:food_apps/views/cart_screen.dart';
import 'package:food_apps/views/notifications/views/notificaion_screen.dart';
import 'package:food_apps/views/widgets/custom_category_chips.dart';
import 'package:food_apps/views/widgets/custom_search_bar.dart';
import 'package:food_apps/views/widgets/food_grid.dart';
import 'package:food_apps/views/widgets/sale_banner.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  Avatar
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Ben",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "Good morning",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Notification Icon
                  IconButton(
                    onPressed: () => Get.to(() => NotificaionScreen()),
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  // Cart Icon
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),

                  // Theme Button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        controller.toggleTheme();
                      },
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            const CustomSearchBar(),

            // Category chips
            const CategoryChips(),

            // Sale banner
            const SaleBanner(),

            // Popular Foods
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Foods",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () => Get.to(() => AllFoodScreen()),
                    child: Text(
                      "See All",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            // Product Foods Grid
            const Expanded(child: FoodGrid()),
          ],
        ),
      ),
    );
  }
}
