class Player

	attr_reader :name, :mark

	def initialize(name, mark)
		@name = name
		@mark = mark
	end

	def mark_grid_at(index, grid)
		grid.cells[index].mark_with(mark)
	end

end