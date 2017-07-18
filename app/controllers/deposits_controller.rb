class DepositsController < ApplicationController
  before_action :find_deposit, only: [:show,:edit,:update,:destroy]
  def index
    @deposits = Deposit.all
  end
  def new
    @deposit = Deposit.new
    @users = User.all.map{ |c| [c.first_name, c.id] }
    @books = Book.all.map{ |c| [c.name, c.id] }
  end
  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.user_id = params[:user_id]
    @deposit.book_id = params[:book_id]
    if @deposit.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @deposit = Deposit.find(params[:id])
    @users = User.all.map{ |c| [c.first_name, c.id] }
    @books = Book.all.map{ |c| [c.name, c.id] }
  end
  def update
    @deposit.user_id = params[:user_id]
    @deposit.book_id = params[:book_id]
    if @deposit.update(deposit_params)
      redirect_to @deposit
    else
      render 'edit'
    end
  end
  def show
    @deposit = Deposit.find(params[:id])
  end
  def destroy
    @deposit.destroy
    redirect_to root_path
  end
  private
  def deposit_params
    params.require(:deposit).permit(:deposit_date, :deadline, :due_date, :user_id, :book_id)
  end
  def find_deposit
    @deposit = Deposit.find(params[:id])

  end

end
