class Recipe < ApplicationRecord
  # belongs_to :user
  belongs_to :category

  has_one_attached :image


  def thumbnail 
    return self.image.variant(resize: '250x250')
  end 

  def large
    return self.image.variant(resize: '500x400') 
  end 
  
end
