import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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

Future<List<Recipe>> loadRecipes() async {
  String jsonString = await rootBundle.loadString('assets/recipes.json');

  final Map<String, dynamic> jsonResponse = json.decode(jsonString);

  final recipeResponse = RecipeResponse.fromJson(jsonResponse);

  return recipeResponse.recipes;
}