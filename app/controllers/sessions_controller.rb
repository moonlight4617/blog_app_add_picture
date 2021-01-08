class SessionsController < ApplicationController
  
  # user action
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      flash[:notice] = "ログインしました"
      redirect_to u_show_path
    else
      flash.now[:notice] = "ログインできません"
      render 'new'
    end
  end

  def destroy
    if session[:user_id] != nil
      log_out
      flash[:notice] = "ログアウトしました"
      redirect_to root_path
    else
      flash.now[:notice] = "ログアウトできません"
    end
  end

  # owner action
  def owner_new
  end

  def owner_create
    owner = Owner.find_by(email: params[:session][:email])
    if owner && owner.authenticate(params[:session][:password])
      session[:owner_id] = owner.id
      flash[:notice] = "ログインしました"
      redirect_to o_show_path
    else
      flash.now[:notice] = "ログインできません"
      render 'new'
    end
  end

  def owner_destroy
    if session[:owner_id] != nil
      log_out
      flash[:notice] = "ログアウトしました"
      redirect_to root_path
    end
  end

end
