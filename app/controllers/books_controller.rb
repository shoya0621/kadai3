class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
    
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      
      render :index
     end
     
  end
  
  
  def edit
    @book = Book.find(params[:id])
    unless current_user.id == @book.user_id
      redirect_to user_path(current_user.id)
      
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updateed book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
      
    end
  end
  
  
  private 
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
