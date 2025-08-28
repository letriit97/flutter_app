// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:get/get.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter Food',
                    style: AppTextStyle.withColor(
                      AppTextStyle.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),

              // Add filter options here
              SizedBox(height: 24),

              // Price range
              Text(
                'Price Range',
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Min',
                        prefixText: '\$',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                          ),
                        ),
                      ),

                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Max',
                        prefixText: '\$',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                          ),
                        ),
                      ),

                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),
              Text(
                'Categories',
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),

              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    ['All', 'Vegetarian', 'Vegan', 'Gluten-Free', 'Dairy-Free']
                        .map(
                          ((category) => FilterChip(
                            label: Text(category),
                            selected: category == 'All',
                            onSelected: (bool value) {},
                            backgroundColor: Theme.of(context).cardColor,
                            selectedColor: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.2),
                            labelStyle: AppTextStyle.withColor(
                              AppTextStyle.bodyMedium,
                              category == 'All'
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.color!,
                            ),
                          )),
                        )
                        .toList(),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: () {
                    // Apply filters
                  },
                  child: Text(
                    'Apply Filters',
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
}
