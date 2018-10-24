class MemoriamsController < ApplicationController
  def index
    @memoriams = Memoriam.all
  end

  def new
    @memoriam = Memoriam.new
  end

  def create
    @memoriam = Memoriam.new(memoriam_params)

    if @memoriam.save
      flash[:notice] = "Your memorial has been posted succesfully, thank you."
      redirect_to memoriams_path
    else
      flash.now[:alert] = "There was an error, please try again."
      render :new
    end
  end

  def show
    @memoriam = Memoriam.find(params[:id])
  end

  def destroy
    @memoriam = Memoriam.find(params[:id])

    if @memoriam.destroy
      flash[:notice] = "\"#{@memoriam.name}\" was deleted successfully."
      redirect_to memoriams_path
    else
      flash.now[:alert] = "There was an error deleting the memorial."
      render :show
    end
  end

  private

  def memoriam_params
    params.require(:memoriam).permit(:name, :born, :died, :obit, :image)
  end
end
