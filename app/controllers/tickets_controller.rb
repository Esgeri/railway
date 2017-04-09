class TicketsController < ApplicationController
  before_action :set_ticket, only: [ :show ]

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Thanks for bought!'
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id],
                                        start_station_id: params[:start_station_id],
                                        end_station_id: params[:end_station_id])
  end

  private

  def set_ticket
    @ticket  = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passport_number, :number)
  end
end
