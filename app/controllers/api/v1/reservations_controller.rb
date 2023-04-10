class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: @current_user.id)
    render json: reservations
  end
  
  def create
    @reservation = Reservation.new(reservation_params.merge(user_id: current_user_id))
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    if @reservation.destroy
      render json: { message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: { message: 'Reservation could not be deleted' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.permit(:start_date, :end_date, :room_id)
   end
end
