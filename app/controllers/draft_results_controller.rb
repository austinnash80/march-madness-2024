class DraftResultsController < ApplicationController
  before_action :set_draft_result, only: %i[ show edit update destroy ]

  # GET /draft_results or /draft_results.json
  def index
    @draft_results = DraftResult.all
  end

  # GET /draft_results/1 or /draft_results/1.json
  def show
  end

  # GET /draft_results/new
  def new
    @draft_result = DraftResult.new
  end

  # GET /draft_results/1/edit
  def edit
  end

  # POST /draft_results or /draft_results.json
  def create
    @draft_result = DraftResult.new(draft_result_params)

    respond_to do |format|
      if @draft_result.save
        format.html { redirect_to draft_result_url(@draft_result), notice: "Draft result was successfully created." }
        format.json { render :show, status: :created, location: @draft_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @draft_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draft_results/1 or /draft_results/1.json
  def update
    respond_to do |format|
      if @draft_result.update(draft_result_params)
        format.html { redirect_to draft_result_url(@draft_result), notice: "Draft result was successfully updated." }
        format.json { render :show, status: :ok, location: @draft_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @draft_result.errors, status: :unprocessable_entity }
      end
    end
  end

  def download_csv
    @draft_results = DraftResult.all

    respond_to do |format|
      format.csv { send_data @draft_results.to_csv, filename: "Draft_results-#{Date.today}.csv" }
    end
  end


  # DELETE /draft_results/1 or /draft_results/1.json
  def destroy
    @draft_result.destroy!

    respond_to do |format|
      format.html { redirect_to draft_results_url, notice: "Draft result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft_result
      @draft_result = DraftResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draft_result_params
      params.require(:draft_result).permit(:game_id, :school_id, :player)
    end
end
