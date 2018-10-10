class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new
    @admin.name = params[:admin][:name]
    @admin.password = params[:admin][:password]
    @admin.password_confirmation = params[:admin][:password_confirmation]

    if @admin.save
      redirect_to root_path
    else
      render :new
    end
  end
end
