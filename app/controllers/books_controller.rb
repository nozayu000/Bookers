class BooksController < ApplicationController
# before_action :set_book, only: [:show, :edit, :update, :destroy]


  def show
    @book = Book.find(params[:id])
  end


  def index
    @books = Book.all
    @book = Book.new(book_path)
    # @book = Book.new(book_params)
  end


def new
  @book = Book.new
end



  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully created book!"
    else
      render 'index'
    end
  end

  # def update
  #   if @book.update()
  #     redirect_to book_path(@book), notice: "successfully updated book!"
  #   else
  #     render 'edit'
  #   end
  # end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    # book.update(book_params)
    redirect_to book_path(@book)
    # redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  
  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path  
  end

  
  # def destroy
  #     @book.destroy
  #     redirect_to books_path, notice: "successfully delete book!"
  # end
  
  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
end