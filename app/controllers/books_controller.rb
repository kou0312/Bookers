class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_path(book.id)
  end


  def show
    @list = Book.find(params[:id])

  end

  def edit
    @list = Book.find(params[:id])
  end

  def updtate
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_back(fallback_location: index_path)
  end

  def new

  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
