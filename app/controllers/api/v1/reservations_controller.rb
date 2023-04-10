class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: @current_user.id)
    render json: reservations
  end
end
