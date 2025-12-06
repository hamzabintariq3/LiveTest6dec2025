import 'dart:convert';
import 'package:flutter/material.dart';

const String correctedJson = '''
{
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "ingredients": ["tomatoes", "mozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "ingredients": ["bananas", "milk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "ingredients": ["berries", "yogurt", "granola"]
    }
  ]
}
''';

class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;

  Recipe({required this.title, required this.description, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}

class RecipeResponse {
  final List<Recipe> recipes;

  RecipeResponse({required this.recipes});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    var recipesList = json['recipes'] as List;
    List<Recipe> recipeObjects = recipesList.map((i) => Recipe.fromJson(i)).toList();

    return RecipeResponse(recipes: recipeObjects);
  }
}


void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe List App',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  bool isLoading = true;
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipesFromJson();
  }

  void _loadRecipesFromJson() {
    Future.delayed(const Duration(seconds: 2), () {
      final Map<String, dynamic> jsonResponse = json.decode(correctedJson);

      final recipeResponse = RecipeResponse.fromJson(jsonResponse);

      setState(() {
        recipes = recipeResponse.recipes;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe List"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.green),
              title: Text(
                recipe.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(recipe.description),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(' "${recipe.title}"  selected!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}