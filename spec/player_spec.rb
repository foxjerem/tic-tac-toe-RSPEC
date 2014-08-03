require 'player'

describe Player do

	let(:mark)		{ double :mark													}
	let(:player) 	{ Player.new('human', mark) 						}
	let(:cell)		{ double :cell, :mark_with => nil 			}
	let(:cells) 	{ Array.new(Grid::DEFAULT_SIZE, cell)		}
	let(:grid)		{ double :grid, :cells => cells					}

	it 'should have a name' do
		expect(player.name).to eq 'human'
	end

	it 'should have a mark' do
		expect(player.mark).to be mark
	end
	
	it 'should be able to mark the grid' do
		expect(grid.cells[0]).to receive(:mark_with).with(mark)
		player.mark_grid_at(0, grid)	
	end
	
end