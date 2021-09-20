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
      flash[:notice] = "successfully created book!"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
end

  def edit
    @book = Book.find(params[:id])
  end
  
  # def update
  #   @book = Book.find(params[:id])
  #   @book.update(book_params)
  #   redirect_to book_path(@book)
  # end


 def update
    if @book.update(params[:id])
      @book.save
      flash[:notice] = "successfully" 
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      render 'edit'
    end
  end
  
  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path  
  end
  
  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
end