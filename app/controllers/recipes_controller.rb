class RecipesController < ApplicationController

  def index 
  end 

  def new 
  end 

  private 

  def recipe_params 
    params.require(:recipe).permit(:title, :description, :image, :level, :yields)
  end 
  
end
