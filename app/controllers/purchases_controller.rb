class PurchasesController < ApplicationController
  before_action :current_user

  def index
    @candies= Candy.all
    @purchases= Purchase.all
    @user = current_user
    respond_to do |format|
      format.json {render json: @purchases}
      format.html {render :index}
      
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @user = current_user
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @purchase }
    end
  end



  def new
    @message = params[:message]
    @purchase = Purchase.new(:user_id => params[:user_id], :candy_id => params[:candy_id])
  end

  def create
    @purchase = Purchase.new(:user_id => params[:user_id], :candy_id => params[:candy_id], :payment_type => params[:payment_type])
    if @purchase.get_cavities
      @purchase.update(:payment_type => params[:payment_type])
      @purchase.save
    end
    @message = @purchase.purchase_candy, @purchase.hunger
    redirect_to user_path(@purchase.user, :message => @message)

  end

  def purchase_error
    if @purchase.errors.any?
      @purchase.errors.full_messages.each do |msg|
        @error = msg
      end
    end
  end

  private

  def set_purchase
    @purchase= Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:user_id, :candy_id, :payment_type)
  end
end
