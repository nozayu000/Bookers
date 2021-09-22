class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])

  end

  def index
    @books = Book.all
    @book = Book.new
  end

def create
      @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice:"successfully created book!"
    else
      @books = Book.all
      render 'index'
    end
end

  def edit
    @book = Book.find(params[:id])
  end


def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # @book
      redirect_to book_path(@book), notice:"successfully updated book!"
    else
      #updateを失敗すると編集ページへ
      render 'edit'
    end
end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path(@book),　notice:"successfully destroyed book!"
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
end