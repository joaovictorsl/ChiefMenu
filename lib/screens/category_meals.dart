import 'package:chief_menu/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category['id']))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category['title']!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MealItem(
              meal: categoryMeals[i],
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
