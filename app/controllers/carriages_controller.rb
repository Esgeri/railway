class CarriagesController < ApplicationController
  # before_action :set_train, only: [ :new, :create ]
  before_action :set_carriage, only: [ :show, :edit, :update, :destroy ]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to @carriage
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  # def set_train
  #   @train = Train.find(params[:train_id])
  # end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type,
                                                           :number,
                                                           :top_seats,
                                                           :bottom_seats,
                                                           :side_top_seats,
                                                           :side_bottom_seats,
                                                           :only_seat,
                                                           :train_id)
  end
end
