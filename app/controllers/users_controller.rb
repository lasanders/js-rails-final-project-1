require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @message = params[:message]
  end

  def candies
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      user_error
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      user_error
      render :edit
    end
  end

  def user_error
    if @user.errors.any?
      @user.errors.full_messages.each do |msg|
        @error = msg
      end
    end
  end

  private
    
  def set_user
    @user = User.find(params[:id])
  end

    def user_params
        params.require(:user).permit(:name, :password, :taste, :cash, :appetite, :employee, candy_ids: [], purchases_attributes: [:candy_id, :user_id, :payment_type], purchase_ids: [], candies_attributes: [:name, :taste, :appetite, :cost, comments_attributes: [:name, :candy_id, :user_id], comment_ids: []])

end
end
