class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    session[:owner_id] = @owner.id
      if @owner.save
        redirect_to o_show_path      
      else
        render 'new'
      end
  end

  def show
    @owner = Owner.find_by(id: session[:owner_id])
    @shops = Shop.where(owner_id: @owner.id)
  end

  def edit
    @owner = Owner.find_by(id: session[:owner_id])
  end

  def update
    @owner = Owner.find_by(id: session[:owner_id])
    if @owner.update(owner_params)
      redirect_to o_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @owner = Owner.find_by(id: session[:owner_id])
    @owner.dfg = 1
    @owner.save
    redirect_to root_path
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :email, :password, :password_confirmation)
    end
end
