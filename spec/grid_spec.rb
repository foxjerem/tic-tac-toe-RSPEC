require 'grid'

describe Grid do

	let(:grid) 	{ Grid.new }
		
	it 'should hold 9 cells when created' do
		expect(grid.cells.count).to eq Grid::DEFAULT_SIZE
		expect(grid.cells.all?{ |cell| cell.is_a?(Cell) }).to be true
	end

end