
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const HomeScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recipes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bullet point and title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bullet point
                      const Padding(
                        padding: EdgeInsets.only(top: 2, right: 10),
                        child: Text(
                          '•',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Title (bold)
                      Expanded(
                        child: Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Description (indented under title)
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 4),
                    child: Text(
                      recipe.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ),
                  // Divider (except for last item)
                  if (index < recipes.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      child: Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const HomeScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(
              recipe.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              recipe.description,
              style: const TextStyle(fontSize: 14),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            trailing: Text(
              '${recipe.ingredients.length} items',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

 */