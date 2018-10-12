class PledgesController < ApplicationController
  def index
    require_sign_in
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)

    if @pledge.save?
      flash[:notice] = "Thank you for your interest! We will return your inquiry within 24 hours"
      redirect_to action: welcome_welcome_path
    else
      flash.now[:alert] = "There was an error, please try again."
      render :new
    end
  end


  def show
    @pledge = Pledge.find(params[:pledge_id])
  end

  def update
  end

  def delete
  end

  private

  def pledge_params
    params.require(:pledge).permit(:name, :email, )
  end
end
