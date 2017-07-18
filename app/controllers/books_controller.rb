class BooksController < ApplicationController
  before_action :find_book, only: [:show,:edit,:update,:destroy]
  def index
    if params[:category].blank?
    @books = Book.all.order("created_at DESC")
    else
      @category = Category.find_by(name: params[:category])
      @books = Book.where(:category => @category).order("created_at DESC")
    end
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
    @categories = Category.all.map{ |c| [c.name, c.id] }

  end
  def create
    @book = Book.create(book_params)
    @book.category_id = params[:category_id]


    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }

  end
  def update
    @book.category_id = params[:category_id]
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end
  def destroy
    @book.destroy
    redirect_to root_path
  end
   private
  def book_params
    params.require(:book).permit(:name, :page_count, :state, :author,:category_id, :book_img)
  end
  def find_book
    @book = Book.find(params[:id])
  end
end
