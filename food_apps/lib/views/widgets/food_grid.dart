import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_apps/models/food.dart';
import 'package:food_apps/views/widgets/food_card.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];
        return GestureDetector(
          onTap: () {},
          child: FoodCard(food: food),
        );
      },
    );
  }
}
