class CommentsController < ApplicationController
  before_action :current_user
  
  def index
    @candies= Candy.all
    @comments= Comment.all
    # @users = User.all
    respond_to do |format|
      format.json {render json: @comments}
      format.html {render :index}
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @user = current_user
    respond_to do |format|
      format.json {render json: @comment}
      format.html {render :show}
    end
  end

  def new
    @comment = Comment.new(:name => :name, :user_id => params[:user_id], :candy_id => params[:candy_id])
  end

  def create
    @comment = Comment.create(:name => params[:name], :user_id => params[:user_id], :candy_id => params[:candy_id])
    #   binding.pry
   
    redirect_to candy_path(@comment.candy)
  end

  def edit
    @comment= Comment.find(params[:id])
  end

  def update
    @comment= Comment.find(params[:id])
    @comment.update(comment_params)
      redirect_to candy_path(@comment.candy)
  
  end
  
private
  
  
  def set_comment
    @comment= Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:name, :user_id, :candy_id)
  end
  
end