class RecipesController < ApplicationController

  def index 
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      if @category.nil?
        redirect_to root_path, "Category not found"
      else
        @recipes = @category.recipes 
      end 
    else 
      @recipes = Recipe.all 
    end 
  end 

  def new 
    @recipe = current_user.recipes.build
  end 

  def create 
    @recipe = category.recipes.build(recipe_params)
    @recipe.image.attach(params[:recipe][:image])

    if @recipe.save 
      redirect_to category_recipe_path(@recipe.category_id, @recipe)
    else 
      render :new 
    end  
  end 

  def show 
    @recipe = Recipe.find(params[:id])
  end 

  private 

  def set_recipe 
    @recipe = Recipe.find(params[:id])
  end 

  def recipe_params 
    params.require(:recipe).permit(:title, :description, :image, :level, :yields, :category_id)
  end 
  
end
