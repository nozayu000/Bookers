class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new(book_params)
    # @book = Book.new(book_path)
  end

  def show
     @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
      # redirect_to todolist_path(@list.id)
    else
      render :book_path
      # indexアクション
      # render :new
      # newアクション（アクション呼び出し）を実行しているわけではない。new.html.erbを表示しているだけ
    end
  end

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
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
