// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/models/food.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/widgets/size_collector.dart';
import 'package:share_plus/share_plus.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;
  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _shareFood(context, food.title, food.description!);
            },
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Images
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    food.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // favorite button
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      food.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: food.isFavorite
                          ? Theme.of(context).primaryColor
                          : (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // Food Detail
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.title,
                        style: AppTextStyle.withColor(
                          AppTextStyle.h1,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),

                      // Giá
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        food.price.toStringAsFixed(0) + ' đ',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h1,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    food.category,
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    'Select Size',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Size options
                  const SizeCollector(),

                  // Description
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    'Description',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    food.description!,
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),

              SizedBox(width: screenWidth * 0.04),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Buy now',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareFood(
    BuildContext context,
    String title,
    String description,
  ) async {
    // Implement share functionality
    // Get the render box share position
    final box = context.findRenderObject() as RenderBox?;

    final String shopLink = 'https://example.com/food/$title';
    final String shareMessage = '$description\n\n$shopLink';

    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: title,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      if (result.status == ShareResultStatus.success) {
        // Shared successfully
        debugPrint('Shared successfully');
      } else if (result.status == ShareResultStatus.dismissed) {
        // Share dismissed
      } else {
        // Handle other statuses if needed
      }
    } catch (e) {
      // Handle error
      debugPrint('Error sharing food: $e');
    }
  }
}
