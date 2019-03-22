class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]

  def new 
    @category = Category.new 
  end 

  def create 
    @category = Category.new(category_params)
      if @category.save 
        redirect_to category_path(@category) 
      else 
        render :new 
      end 
  end 

  def show 
  end 

  def edit 
  end 

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category was updated"
      redirect_to category_path(@category)
    else
      flash[:notice] = "Category was not updated"
      render 'edit'
    end  
  end 

  private 

  def set_category
    @category = Category.find(params[:id])
  end 

  def category_params
    params.require(:category).permit(:name)
  end 
end
