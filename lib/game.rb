require 'grid'
require 'player'

class Game
	
	attr_reader :grid, :players, :current_player, :other_player
	
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
		puts grid.inspect
		winner = WINNING_COMBOS.select do |combo|
			grid.cells[combo[0]] == grid.cells[combo[1]] && grid.cells[combo[1]] == grid.cells[combo[2]] && grid.cells[combo[0]]
		end
		grid[winner.first.first] == "x" ? player1 : player2 if winner.any?		
	end

end