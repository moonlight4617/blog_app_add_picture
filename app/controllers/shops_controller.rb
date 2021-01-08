class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :new_calendar]

  def index
    @shops = Shop.where(owner_id: session[:owner_id])
  end

  def new
    @Shop = Shop.new
  end

  def create
    owner = Owner.find_by(id: session[:owner_id])
    @shop = owner.shops.build(shop_params)
    if @shop.save
      flash[:notice] = "投稿しました"
      redirect_to o_show_path      
    else
      flash[:notice] = "投稿できません"
      render 'new'
    end
  end

  def show
    if @shop.dfg == 1
      flash[:notice] = "投稿は存在しません"
      redirect_to o_show_path
    end
  end

  def edit
    if @shop.dfg == 1
      flash[:notice] = "投稿は存在しません"
      redirect_to o_show_path
    end
  end

  def update
    if @shop.update(shop_params)
      flash[:notice] = "編集しました"
      redirect_to o_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @shop.dfg = 1
    @shop.save
    flash[:notice] = "削除されました"
    redirect_to o_show_path
  end

  def create_calendar
    @reservation = @shop.build_reservation(reserve_params)
  end

  def my_calendar
    @reservations = Reservation.where(shop_id: params[:id])
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :details, :picture)
    end

    def set_shop
      @shop = Shop.find_by(id: params[:id])
    end

    def reserve_params
      params.require(:reservation).permit(:shop_id, :title , :body, :start_date, :end_date)
    end
end