require 'grid'

describe Grid do

	let(:grid) 	{ Grid.new }
		
	it 'should hold 9 empty cells when created' do
		expect(grid.cells.count).to eq Grid::DEFAULT_SIZE
		expect(grid).to be_empty
		expect(grid.cells.all?{ |cell| cell.is_a?(Cell) }).to be true
	end

	it 'should know the content of a cell by index' do
		expect(grid.value(0)).to eq nil
		grid.cells[0].mark_with('x')
		expect(grid.value(0)).to eq 'x'
	end

end