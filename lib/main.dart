
import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/recipe.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const RecipeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // JSON data as provided in the PDF
  final String jsonData = '''
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

  @override
  Widget build(BuildContext context) {
    // Parse JSON data
    try {
      final Map<String, dynamic> jsonMap = json.decode(jsonData);
      final recipeResponse = RecipeResponse.fromJson(jsonMap);
      final recipes = recipeResponse.recipes;

      return HomeScreen(recipes: recipes);
    } catch (e) {
      // Fallback in case of JSON parsing error
      print('Error parsing JSON: $e');
      return const Scaffold(
        body: Center(
          child: Text('Error loading recipes'),
        ),
      );
    }
  }
}



/*

import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/recipe.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RecipeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // JSON data as provided in the PDF
  final String jsonData = '''
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

  @override
  Widget build(BuildContext context) {
    // Parse JSON data
    final Map<String, dynamic> jsonMap = json.decode(jsonData);
    final recipeResponse = RecipeResponse.fromJson(jsonMap);
    final recipes = recipeResponse.recipes;

    return HomeScreen(recipes: recipes);
  }
}

 */