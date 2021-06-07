class GreenhousesController < ApplicationController
  before_action :set_greenhouse, only: %i[ show edit update destroy ]

  # GET /greenhouses or /greenhouses.json
  def index
  end

  def datatable
    @greenhouses = Greenhouse.all

    respond_to do |format|
      format.json { render json: GreenhouseDatatable.new(params, collection: @greenhouses) }
    end
  end

  # GET /greenhouses/1
  def show
    @audit = @greenhouse.versions
  end

  # GET /greenhouses/new
  def new
    @greenhouse = Greenhouse.new
  end

  # GET /greenhouses/1/edit
  def edit
  end

  # POST /greenhouses or /greenhouses.json
  def create
    @greenhouse = Greenhouse.new(greenhouse_params)

    respond_to do |format|
      if @greenhouse.save
        format.html { redirect_to @greenhouse, notice: Greenhouse.human_notice(:created) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greenhouses/1 or /greenhouses/1.json
  def update
    respond_to do |format|
      if @greenhouse.update(greenhouse_params)
        format.html { redirect_to @greenhouse, notice: Greenhouse.human_notice(:updated) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greenhouses/1 or /greenhouses/1.json
  def destroy
    @greenhouse.destroy
    respond_to do |format|
      format.html { redirect_to greenhouses_url, notice: Greenhouse.human_notice(:destroyed) }
    end
  end

  def rollback
    @greenhouse = Greenhouse.find(params[:greenhouse_id])
    version = @greenhouse.versions.find(params[:version])
    if version.reify.save
      redirect_to @greenhouse, notice: Greenhouse.human_notice(:rollbacked)
    else
      render :show, error: Greenhouse.human_notice(:rollback)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greenhouse
      @greenhouse = Greenhouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greenhouse_params
      params.require(:greenhouse).permit(:name, :description)
    end
end
