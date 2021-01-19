class RecipesController < ApplicationController

  def new 
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "salt")
    @recipe.ingredients.build(name: "pepper")
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [ :name, :quantity ])
  end

end
