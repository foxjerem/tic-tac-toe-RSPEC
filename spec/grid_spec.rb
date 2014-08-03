require 'grid'

describe Grid do

	let(:grid) 	{ Grid.new }
		
	it 'should hold 9 empty cells when created' do
		expect(grid.cells.count).to eq Grid::DEFAULT_SIZE
		expect(grid).to be_empty
		expect(grid.cells.all?{ |cell| cell.is_a?(Cell) }).to be true
	end

end