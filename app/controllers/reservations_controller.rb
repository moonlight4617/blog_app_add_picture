class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  def new
    @reservation = Reservation.new
  end

  def create
    shop = Shop.find(params[:id])
    @reservation = Reservation.new(reserve_params)
    @reservation.shop_id = shop.id
    if @reservation.save
      redirect_to r_show_path(@reservation)
    else
      render 'new'
    end
  end

  def show
    @shop = Shop.find_by(id: params[:id])
  end

  def edit
    if @reservation.shop != current_shop
      redirect_to root_path
    end
  end

  def update
    if @reservation.update(reserve_params)
      redirect_to reservation_path(@reservation)
    else
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to my_calendar_path
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reserve_params
      params.require(:reservation).permit(:shop_id, :title , :body, :start_date, :end_date)
    end
end
