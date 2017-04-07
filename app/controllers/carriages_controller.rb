class CarriagesController < ApplicationController
  before_action :set_train, only: [ :new, :create ]

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to @train
    else
      render :new
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type,
                                                           :number,
                                                           :top_seats,
                                                           :bottom_seats,
                                                           :side_top_seats,
                                                           :side_bottom_seats,
                                                           :only_seat)
  end
end
