class RecipesController < ApplicationController
  # GET /recipes
  def index
    recipes = Recipe.all
    render json: recipes, status: :created
  end

  # POST /recipes
  def create
    new_recipe = @current_user.recipes.create!(recipe_params)
    render json: new_recipe, status: :created
  end

  private

  # permissible params to be used by create/update
  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
