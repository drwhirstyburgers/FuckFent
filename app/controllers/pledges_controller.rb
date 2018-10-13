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

    if @pledge.save
      flash[:notice] = "Thank you for your interest! We will return your inquiry within 24 hours"
      redirect_to welcome_welcome_path
    else
      flash.now[:alert] = "There was an error, please try again."
      render :new
    end
  end


  def show
    @pledge = Pledge.find(params[:id])
  end

  def destroy
    @pledge = Pledge.find(params[:id])

    if @pledge.destroy
      flash[:notice] = "\"#{@pledge.name}\" was deleted successfully."
      redirect_to pledges_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  private

  def pledge_params
    params.require(:pledge).permit(:name, :email, :notes, :payment_type, :amount, :complete)
  end
end
