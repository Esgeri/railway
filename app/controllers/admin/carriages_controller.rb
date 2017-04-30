class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: [:new, :create, :index]
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to admin_train_carriages_path
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to [:admin, @carriage.train]
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage.train]
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.destroy
    redirect_to admin_train_path(train)
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:type,
                                     :number,
                                     :top_seats,
                                     :bottom_seats,
                                     :side_top_seats,
                                     :side_bottom_seats,
                                     :only_seat)
  end
end
