class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reserved_motorcycles = Reservation.where(id: params[:id])
    if @reserved_motorcycles
      render json: @reserved_motorcycles
    else
      render json: { error: 'Unable to find your reservation' }, status: :unprocessable_entity
    end
  end

  def create
    # @motorcycle = Motorcycle.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    # @reservation.motorcycle_id = @motorcycle.id
    # @reservation.user_id = current_user.id
    # @reservation.total_price =
    if @reservation.save
      render json: { message: 'reservation created' }, status: :created
    else
      render json: { error: 'Unable to create reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    if Reservation.find(params[:id]).destroy
      render json: { message: 'reservation deleted' }
    else
      render json: { error: 'Unable to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:motorcycle_id, :user_id, :total_price, :start_date, :end_date, :city)
  end
end
