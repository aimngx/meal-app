import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategory
          .map(
            (catData) => CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            ),
          )
          .toList(),
    );
  }
}
