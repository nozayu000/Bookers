class BooksController < ApplicationController

def index
  @books = Book.all
  @book = Book.new
end

def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully created book!"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render  :index
    end
end

def show
  @book = Book.find(params[:id])
end

def edit
  @book = Book.find(params[:id])
end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully updated book!"
      redirect_to book_path(@book)
    else
      @books=Book.all
      render :edit
    end
end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "successfully destroyed book!"
    redirect_to books_path
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
end
