class CommentsController < ApplicationController
  
  
    def index
      @comments= Comment.all
      @candies= Candy.all
      @user = current_user
      respond_to do |format|
        format.html {render :index}
        # format.json {render json: @comments}
        
    end
  end
   
      def candies
        @user = User.find(params[:id])
      end    
        
      
    

    def new
      @comment= Comment.new
  
    end
  
    def create
      @comment= Comment.create(comment_params)
        
        @comments = Comment.all
       render json: @comment
          
          
  
  end

    def edit
      @comment= Comment.find(params[:id])
    end
  
    def update
      @comment= Comment.find(params[:id])
      @comment.update(comment_params)
        respond_to do |format|
        
          format.json {render json: @comment}
    end
  end
  
    def destroy
  
      @comment= Comment.last
      @comment.destroy
      respond_to do |format|
        format.html {render :index}
      end
    end
  
    private
  
  
    def set_comment
      @comment= Comment.find(params[:id])
    end
  
    def comment_params
      params.permit(:user_id, :candy_id, :name)
    end
  
  end