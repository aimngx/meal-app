import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({super.key});

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    // use firstWhere as it looks through the list, once they found it, they stop looking through it
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //for image
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  },
                ),
              ),
              buildSectionTitle('Steps', context),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '# ${(index + 1)}',
                            ),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
