import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/models/RecipeStep.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';

class RecipeListRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Recipe>> get() async {
    final response = await _helper.getAuth("/recipe/potentialRecipes");
    List<Recipe> listRecipe = [];

    response["results"].forEach((recipe) {
      listRecipe.add(Recipe.fromJson(recipe));
    });
    return listRecipe;
  }

  Future<Recipe> getOne(id) async {
    final response = await _helper.postAuthRecipeDetail("/recipe/recipeDetail", id);
    Recipe recipe = Recipe.fromJson(response);

    return recipe;
  }

  Future<void> favoriteToggle(id) async {
    final response = await _helper.postAuthFavoriteToggle("/favorite/check", id);
    print(response);
  }

    Future<void> sendRating(recipeId, rate ) async {
    final response = await _helper.postAuthSendUserRating("/review/new", recipeId, rate);
    print(response);
  }


  Future<List<Recipe>> getFavorites() async {
    final response = await _helper.getAuth("/favorite/favoriteRecipe");
    List<Recipe> listRecipe = [];

    response["results"].forEach((recipe) {
      listRecipe.add(Recipe.fromJson(recipe));
    });
    return listRecipe;
  }

  Future<List<Recipe>> searchRecipe(saisis) async {
    final response = await _helper.postAuthRecipeSearch("/recipe/search", saisis);
    List<Recipe> listRecipe = [];

    response["results"].forEach((recipe) {
      listRecipe.add(Recipe.fromJson(recipe));
    });

    return listRecipe;
  }
}


     // List<Ingredient> ingredients = [];
      // List<RecipeStep> steps = [];

      // recipe["ingredients_list"].forEach((ingredient) {
      //   ingredients.add(Ingredient.fromJson(ingredient));
      // });

      // recipe["recipe_steps"].forEach((step) {
      //   steps.add(RecipeStep(
      //       step_number: step["step_number"] as int,
      //       step: step["step"] as String));
      // });

      //   listRecipe.add(
      //    Recipe(
      //       id: recipe["id"] as String,
      //       title: recipe["title"] as String,
      //       summary: recipe["summary"] as String,
      //       image: recipe["image"] as String,
      //       ready_in_minutes: recipe["ready_in_minutes"] as int,
      //       serving: recipe["serving"] as int,
      //       preparation_minutes: recipe["preparation_minutes"] as int,
      //       cooking_minutes: recipe["cooking_minutes"] as int,
      //       vegetarian: recipe["vegetarian"] as bool,
      //       vegan: recipe["vegan"] as bool,
      //       gluten_free: recipe["gluten_free"] as bool,
      //       dairy_free: recipe["dairy_free"] as bool,
      //       ingredients_list: ingredients,
      //       recipe_steps: steps),
      // );