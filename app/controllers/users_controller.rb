class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      flash[:notice] = "登録されました"
      redirect_to root_path
    else
      flash.now[:notice] = "登録できません"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集されました"
      redirect_to u_show_path
    else
      flash.now[:notice] = "編集できません"
      render 'edit'
    end
  end

  def destroy
    @user.dfg = 1
    if @user.save
      flash[:notice] = "削除されました"
      redirect_to root_path
    else
      flash.now[:notice] = "削除できません"
      render u_show_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end

    def set_user
      @user = User.find_by(id: sesion[:user_id])
    end
end
