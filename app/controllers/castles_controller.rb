class CastlesController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index]

  def index
    @castles = Castle.all

    @castles = Castle.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@castles) do |castle, marker|
      marker.lat castle.latitude
      marker.lng castle.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @castle = Castle.new
    # @user = current_user
  end

  def create
    @castle = Castle.create(castle_params)
    @castle.user = current_user
    if @castle.save
      redirect_to castle_path(@castle)
    else
      render :new
    end
  end

  def show
    set_castle

    @booking = Booking.new
    @checkin = params['checkin_on']
    @checkout = params['checkout_on']
    if ((!@checkin.blank?) && (!@checkout.blank?))
      from = @checkin.split("/")
      to = @checkout.split("/")
      start = Date.new(from[2].to_f, from[1].to_f - 1, from[0].to_f)
      finish = Date.new(to[2].to_f, to[1].to_f - 1, to[0].to_f)
      @nb_days = (finish - start).to_f
      @total_price = (@nb_days * @castle.price.to_f).round
    end
    @castle = Castle.find(params[:id])
    @bookings = @castle.bookings
    @alert_message = "You are viewing the castle of #{@castle.user.first_name}"
  end

  def edit
    set_castle
  end


  def update
    set_castle
    @castle.update(castle_params)
    redirect_to castle_path(@castle)
  end

  def destroy
    set_castle
    @castle.destroy
    redirect_to root_path
  end


  private

  def castle_params
    params.require(:castle).permit(:address, :title, :photo, :price, :description, :country, :city, :zipcode, :photo, :blanket_type, :pillow, :breakfast)
  end

  def set_castle
    @castle = Castle.find(params[:id])
  end

end