// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:food_apps/models/food.dart';
import 'package:food_apps/utils/app_textstyle.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //  Images
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    food.imageUrl ?? 'assets/images/placeholder.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Favorites Button
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    food.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: food.isFavorite
                        ? Theme.of(context).primaryColor
                        : isDark
                        ? Colors.grey[400]
                        : Colors.grey,
                  ),
                  onPressed: () {
                    // Handle favorite toggle
                  },
                ),
              ),

              // Nếu có giá cũ
              if (food.oldPrice != null)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // Giảm giá
                    child: Text(
                      '\$${calculateDiscount(food.oldPrice!, food.price)} OFF',
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                          AppTextStyle.bodySmall,
                          FontWeight.bold,
                        ),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Food Details
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food Name
                Text(
                  food.title,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h2, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: screenWidth * 0.01),

                // Food Category
                Text(
                  food.category,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h3, FontWeight.bold),
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: screenWidth * 0.02),

                // Price and Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      '${food.price.toStringAsFixed(0)} đ',
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                          AppTextStyle.bodyLarge,
                          FontWeight.bold,
                        ),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),

                    // Có giá cũ
                    if (food.oldPrice != null)
                      Text(
                        '${food.oldPrice!.toStringAsFixed(0)} đ',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodySmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),

                    // // Add Button
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle add to cart action
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   child: const Icon(Icons.add),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int calculateDiscount(double currentPrice, double oldPrice) {
    if (oldPrice == 0) return 0;
    return ((oldPrice - currentPrice) / oldPrice * 100).round();
  }
}
