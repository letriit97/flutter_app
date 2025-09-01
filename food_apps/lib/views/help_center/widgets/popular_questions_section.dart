import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/help_center/widgets/question_card.dart';

class PopularQuestionsSection extends StatelessWidget {
  const PopularQuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Questions',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),

          const SizedBox(height: 16),
          QuestionCard(
            title: 'How to track my orders?',
            icon: Icons.local_shipping_outlined,
          ),

          const SizedBox(height: 16),
          QuestionCard(
            title: 'How to return an item?',
            icon: Icons.local_shipping_outlined,
          ),
        ],
      ),
    );
  }
}
