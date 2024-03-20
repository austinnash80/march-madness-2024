class PagesController < ApplicationController
	def home_page
		@game = Game.new
		@games = Game.all
		if params[:gameId].present?
			gameid = params[:gameId].to_i 
			redirect_to game_path(gameid)
		end
	end

	 def create_game
	    @game = Game.new(game_params)

	    if @game.save
	      redirect_to root_path, notice: 'Game was successfully created.'
	  	end
	  end

	   private

    def game_params
      	params.require(:game).permit(:status, :p1, :p1_score, :p2, :p2_score, :p3, :p3_score, :p4, :p4_score)
    end

end
