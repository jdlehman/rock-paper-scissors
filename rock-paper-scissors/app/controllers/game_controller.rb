class GameController < ApplicationController
  before_filter :setup, :only => [:play]

	def new
	end

	def play
		@winner = outcome
	end

	private

	def setup
		# generate random computer move
		# convert to symbol
		srand Time.new.sec
		@computer_move = to_symbol(rand(3) + 1)

		# convert player move to symbole
		@player_move = to_symbol(params[:move].to_i)
	end

	def to_symbol(num)
		case num
			when 1
				:rock
			when 2
				:paper
			else
				:scissors
		end
	end

	def outcome
		# return 1 for player win
		# -1 for computer win
		# 0 for tie
		unless @player_move == @computer_move
			win = { :rock => :scissors, :paper => :rock, :scissors => :paper }
			if win[@player_move] == @computer_move
				1
			else
				-1
			end
		else
			0
		end
	end

end
