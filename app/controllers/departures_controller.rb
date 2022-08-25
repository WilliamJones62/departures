class DeparturesController < ApplicationController
  before_action :set_departure, only: %i[ show edit update destroy ]

  # GET /departures or /departures.json
  def index
    @departures = Departure.where(confirmed: false).or(Departure.where(confirmed: true).where('confirmed_time > ?', Time.current - 5.minutes))
  end

  # GET /departures/1 or /departures/1.json
  def show
  end

  # GET /departures/new
  def new
    @departure = Departure.new
  end

  # GET /departures/1/edit
  def edit
  end

  # POST /departures or /departures.json
  def create
    @departure = Departure.new(departure_params)
    if @departure.loaded
      @departure.loaded_time = Time.current
    end

    respond_to do |format|
      if @departure.save
        format.html { redirect_to departures_url, notice: "Departure was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departures/1 or /departures/1.json
  def update
    need_to_save = false

    if @departure.loaded && params[:departure][:loaded] == '0'
      # the user has changed the record to not loaded
      @departure.loaded_time = ''
      @departure.confirmed = false
      @departure.confirmed_time = ''
      params[:confirmed] = ''
      need_to_save = true
    elsif params[:departure][:loaded] == '1' && !@departure.loaded
      # the user has changed the record to loaded
      @departure.loaded_time = Time.current
      need_to_save = true
    end

    if params[:departure][:confirmed] == '1' && !@departure.confirmed
      @departure.confirmed_time = Time.current
      need_to_save = true
    elsif params[:departure][:confirmed] == '0'
      # confirmed turned off
      @departure.confirmed_time = ''
      need_to_save = true
    end

    if need_to_save
      @departure.save
    end

    respond_to do |format|
      if @departure.update(departure_params)
        format.html { redirect_to departures_url, notice: "Departure was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departures/1 or /departures/1.json
  def destroy
    @departure.destroy

    respond_to do |format|
      format.html { redirect_to departures_url, notice: "Departure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure
      @departure = Departure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departure_params
      params.require(:departure).permit(:door, :truck, :route, :loader, :driver, :loaded, :confirmed)
    end
end
