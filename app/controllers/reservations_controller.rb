class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
    @tables      = Table.all
    @dates       = Date.today..(Date.today + 7.days)
    @hours       = Hour.all        # se usar Hour
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.pessoa = current_user.pessoas.first

    if @reservation.save
      redirect_to reservations_path, notice: "Reserva criada!", status: :see_other
    else
      Rails.logger.debug "== Erros de reserva: #{@reservation.errors.full_messages.inspect}"
      @tables = Table.all
      @hours = Hour.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:table_id, :date, :start_time, :end_time, :hour_id)
  end
end
