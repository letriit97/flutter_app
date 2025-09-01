import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/help_center/widgets/category_card.dart';

class HelpCategoriesSection extends StatelessWidget {
  const HelpCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final helpCategories = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
      {'icon': Icons.payment_outlined, 'title': 'Payments'},
      {'icon': Icons.local_shipping_outlined, 'title': 'Shipping'},
      {'icon': Icons.assignment_return_outlined, 'title': 'Returns'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help Categories',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),

          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: helpCategories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                title: helpCategories[index]['title'] as String,
                icon: helpCategories[index]['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}
