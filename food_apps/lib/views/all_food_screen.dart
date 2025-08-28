import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/widgets/filter_bottom_sheet.dart';
import 'package:food_apps/views/widgets/food_grid.dart';

class AllFoodScreen extends StatelessWidget {
  const AllFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'All Foods',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          // Search icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          // Filter icon
          IconButton(
            onPressed: () => FilterBottomSheet.show(context),
            icon: Icon(
              Icons.filter_list,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),

      body: const FoodGrid(),
    );
  }
}
