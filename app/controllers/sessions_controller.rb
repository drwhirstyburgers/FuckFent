class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(name: params[:session][:name])

    if admin && admin.authenticate(params[:session][:password])
      create_session(admin)
      flash[:notice] = "Welcome, #{admin.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    destroy_session(current_admin)
    flash[:notice] = "You've been signed out"
    redirect_to root_path
  end
end
