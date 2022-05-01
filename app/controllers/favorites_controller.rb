class FavoritesController < ApplicationController

  def create
    @book = Book.find_by(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    # @favorites = Favorite.where(book_id: params[:book_id])
    @books = Book.all
    @favorite.save
  end

  def destroy
    @book = Book.find_by(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.delete
    # @favorites = Favorite.where(book_id: params[:book_id])
    @books = Book.all
  end

end
