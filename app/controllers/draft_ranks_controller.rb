class DraftRanksController < ApplicationController
  before_action :set_draft_rank, only: %i[ show edit update destroy ]

  # GET /draft_ranks or /draft_ranks.json
  def index
    @draft_ranks = DraftRank.all
    @seed = params['seed']
    @next_seed = @seed.to_i + 1
    @player = params['player']
    @game = params['game']
    if params['pick'] == 'yes'
      DraftRank.where(game_id: params['game'], player: params['player'], school_id: params['school_id']).delete_all
      ## if game player,school, game already exsists then delete
      DraftRank.create(
        game_id: @game,
        player: @player,
        school_id: params['school_id'],
        rank: params['rank'],
        seed: @seed
        ).save
      redirect_to draft_ranks_path(game: @game, player: @player, seed: @seed)
    end

    if params['pick'] == 'priority'
      DraftRank.where(game_id: @game, player: @player, seed: @seed).update_all priority: true, super_priority: false
        redirect_to draft_ranks_path(game: @game, player: @player, seed: @seed)
    elsif params['pick'] == 'super_priority'
      DraftRank.where(game_id: @game, player: @player, seed: @seed).update_all priority: false, super_priority: true
        redirect_to draft_ranks_path(game: @game, player: @player, seed: @seed)
    elsif params['pick'] == 'priority_remove'
      DraftRank.where(game_id: @game, player: @player, seed: @seed).update_all priority: false
        redirect_to draft_ranks_path(game: @game, player: @player, seed: @seed)
    elsif params['pick'] == 'super_priority_remove'
      DraftRank.where(game_id: @game, player: @player, seed: @seed).update_all super_priority: false
        redirect_to draft_ranks_path(game: @game, player: @player, seed: @seed)
    end
      @super_tie_break = DraftRank.where(game_id: @game, player: @player, seed: @seed).pluck(:super_priority)[0]
      @tie_break = DraftRank.where(game_id: @game, player: @player, seed: @seed).pluck(:priority)[0]
      @tie_breaks_used = DraftRank.where(game_id: @game, player: @player, priority: true).pluck(:seed).uniq.count
      @super_tie_breaks_used = DraftRank.where(game_id: @game, player: @player, super_priority: true).pluck(:seed).uniq.count

  end
  def ranks_review
    
    
  end

  # GET /draft_ranks/1 or /draft_ranks/1.json
  def show
  end

  # GET /draft_ranks/new
  def new
    @draft_rank = DraftRank.new
  end

  # GET /draft_ranks/1/edit
  def edit
  end

  # POST /draft_ranks or /draft_ranks.json
  def create
    @draft_rank = DraftRank.new(draft_rank_params)

    respond_to do |format|
      if @draft_rank.save
        format.html { redirect_to draft_rank_url(@draft_rank), notice: "Draft rank was successfully created." }
        format.json { render :show, status: :created, location: @draft_rank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @draft_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draft_ranks/1 or /draft_ranks/1.json
  def update
    respond_to do |format|
      if @draft_rank.update(draft_rank_params)
        format.html { redirect_to draft_rank_url(@draft_rank), notice: "Draft rank was successfully updated." }
        format.json { render :show, status: :ok, location: @draft_rank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @draft_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draft_ranks/1 or /draft_ranks/1.json
  def destroy
    @draft_rank.destroy!

    respond_to do |format|
      format.html { redirect_to draft_ranks_url, notice: "Draft rank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_csv
    @draft_rank = DraftRank.all

    respond_to do |format|
      format.csv { send_data @draft_rank.to_csv, filename: "Draft_rank-#{Date.today}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft_rank
      @draft_rank = DraftRank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draft_rank_params
      params.require(:draft_rank).permit(:game_id, :school_id, :player, :rank, :priority, :super_priority, :seed, :rq, :r2, :r3, :r4)
    end
end
