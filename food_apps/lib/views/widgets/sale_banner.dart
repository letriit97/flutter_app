import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get 50% off on all items!",
                  style: AppTextStyle.withColor(AppTextStyle.h3, Colors.white),
                ),
                Text(
                  "Special Sales",
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h2, FontWeight.bold),
                    Colors.white,
                  ),
                ),
                Text(
                  "Up to 50% off",
                  style: AppTextStyle.withColor(AppTextStyle.h3, Colors.white),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Text("Shop Now", style: AppTextStyle.buttonMedium),
          ),
        ],
      ),
    );
  }
}
