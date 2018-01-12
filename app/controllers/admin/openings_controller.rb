class Admin::OpeningsController < ApplicationController
  before_action :set_opening, only: [:show, :edit, :update, :destroy]

  # GET /openings
  # GET /openings.json
  def index
    @openings = calendar.openings.all
  end

  # GET /openings/1
  # GET /openings/1.json
  def show
  end

  # GET /openings/new
  def new
    @opening = calendar.openings.new
  end

  # GET /openings/1/edit
  def edit
  end

  # POST /openings
  # POST /openings.json
  def create
    @opening = calendar.openings.new(opening_params)

    respond_to do |format|
      if @opening.save
        format.html { redirect_to [:admin, calendar, @opening], notice: 'Opening was successfully created.' }
        format.json { render :show, status: :created, location: @opening }
      else
        format.html { render :new }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openings/1
  # PATCH/PUT /openings/1.json
  def update
    respond_to do |format|
      if @opening.update(opening_params)
        format.html { redirect_to [:admin, calendar, @opening], notice: 'Opening was successfully updated.' }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1
  # DELETE /openings/1.json
  def destroy
    @opening.destroy
    respond_to do |format|
      format.html { redirect_to admin_calendar_openings_url, notice: 'Opening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opening
    @opening = Opening.where(calendar_id: params[:calendar_id]).find(params[:id])
  end

  def calendar
    @calendar ||= Calendar.find(params[:calendar_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opening_params
    params.require(:opening).permit(:calendar_id, :start_at, :end_at)
  end
end
