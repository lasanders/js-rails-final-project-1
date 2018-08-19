class CandiesController < ApplicationController
before_action:set_candy, only: [ :edit, :update]

def index
@candies= Candy.all
@purchases= Purchase.all
respond_to do |format|
  format.html {render :index}
  format.json {render json: @candy}
end
end

def show
  @candy = Candy.find(params[:id])
  respond_to do |format|
    format.html { render :show }
    format.json { render json: @candy}
  end

end

def new
@candy= Candy.new

end

def create
@candy= Candy.new(candy_params)
    if current_user.employee && @candy.save
        respond_to do |format|
          format.html {render :show}
          format.json {render json: @candy}
        end
        #  render json: @candy
      else
        candy_error
      render json: new
    end
end

def edit
@candy= Candy.find(params[:id])
end

def update
@candy= Candy.find(params[:id])
    if current_user.employee  && @candy.update(candy_params)
        # redirect_to @candy
        respond_to do |format|
          format.html {render :show}
          format.json {render json: @candy}
        end
      else
          candy_error
        render json :edit
    end
end


def destroy

@candy= Candy.last
        @candy.destroy
    # redirect_to candies_path
    respond_to do |format|
      format.html {render :index}
end
end

private


def set_candy
@candy= Candy.find(params[:id])
end

def candy_params
params.require(:candy).permit(:name, :taste, :cost, :appetite, :count, user_attributes: [:name, :password, :taste, :cash, :appetite, :employee], user_ids: [], purchases_attributes: [:candy_id, :user_id], purchase_ids: [])
end

end
