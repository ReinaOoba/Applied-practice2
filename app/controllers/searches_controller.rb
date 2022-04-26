class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]
    @method = params[:method]
    @result = search_for(@model, @word, @method)
  end

  private

  def search_for(model, word, method)
    if model == "user"
      if method == "perfect_match"
        User.where("name LIKE ?", "#{word}")
      elsif method == "forward_match"
        User.where("name LIKE ?", "#{word}%")
      elsif method == "backward_match"
        User.where("name LIKE ?", "%#{word}")
      elsif  method == "partical_match"
        User.where("name LIKE ?", "%#{name}%")
      else
        User.all
      end
    elsif model == "book"
      if method == "perfect_match"
        Book.where("title LIKE ?", "#{word}")
      elsif method == "forward_match"
        Book.where("title LIKE ?", "#{word}%")
      elsif method == "backward_match"
        Book.where("title LIKE ?", "%#{word}")
      elsif  method == "partical_match"
        Book.where("title LIKE ?", "%#{name}%")
      else
        Book.all
      end
    end
  end
end