require_relative 'cell'

class Grid

	DEFAULT_SIZE = 9

	attr_reader :size, :cells

	def initialize
		@size = DEFAULT_SIZE
		@cells = create_cells
	end

	def create_cells
		Array.new(size) { Cell.new }
	end

end