require 'grid'
require 'player'

class Game
	
	attr_accessor :grid
	attr_reader :players, :current_player, :other_player
	
	WINNING_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[2,5,8],[0,4,8],[2,4,6]]

	def initialize(player1, player2)
		@grid = Grid.new
		@current_player = player1
		@other_player = player2
		@players = [current_player, other_player]
	end

	def change_turn
		@current_player, @other_player = @other_player, @current_player
	end

	def go(index)
		current_player.mark_grid_at(index-1, grid)
		change_turn
	end

	def winner
		winner = WINNING_COMBOS.select do |combo|
			grid[combo[0]] == grid[combo[1]] && grid[combo[1]] == grid[combo[2]] && grid[combo[0]]
		end
		grid[winner.first.first] == "x" ? player1 : player2 if winner.any?		
	end

end