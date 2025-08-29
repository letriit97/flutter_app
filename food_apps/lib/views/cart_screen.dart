// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/models/food.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/utils/currency.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'My Cart',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: foods.length,
              itemBuilder: (context, index) =>
                  _buildCartItem(context, foods[index]),
            ),
          ),
          _buildCartSummery(context),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Food food) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // Food image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: Image.asset(
                food.imageUrl!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            // const SizedBox(width: 16),
            // Food details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            food.title,
                            style: AppTextStyle.withColor(
                              AppTextStyle.bodyLarge,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Remove button
                        IconButton(
                          onPressed: () =>
                              _showDeleteConfirmationDialog(context, food),
                          icon: Icon(Icons.delete_outline, color: Colors.red),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food.price.toVietNameseCurrency(),
                          style: AppTextStyle.withColor(
                            AppTextStyle.h3,
                            Theme.of(context).primaryColor,
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '1',
                                style: AppTextStyle.withColor(
                                  AppTextStyle.bodyLarge,
                                  Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Remove button
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummery(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total (5 items)',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              Text(
                '150,000 đ',
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Checkout button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Food food) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[400]!.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                size: 32,
                color: Colors.red[400],
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'Remove Item',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              'Are you sure you want to remove this item from your cart?',
              textAlign: TextAlign.center,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? Colors.white70 : Colors.black12,
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Remove item from cart logic here
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? Colors.white70 : Colors.black12,
                      ),
                    ),
                    child: Text(
                      'Remove',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierColor: Colors.black45,
    );
  }
}
