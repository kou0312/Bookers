class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      redirect_to show_path(book.id)
      flash[:notice]="Book was successfully created."
    else
      render :index
    end
  end


  def show
    @list = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to show_path(@book.id)
      flash[:notice]="Book was successfully updated."
    else
      render :edit
    end
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
