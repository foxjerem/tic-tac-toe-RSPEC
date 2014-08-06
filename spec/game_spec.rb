require 'game'

describe Game do 

	let(:p1) 		{ double :player, name: 'human', :mark => 'x', :mark_grid_at => nil			}
	let(:p2) 		{ double :player, name: 'computer', :mark => 'o', :mark_grid_at => nil	}
	let(:game)	{ Game.new(p1,p2)																												}

	it 'starts with an empty grid' do 
		expect(game.grid).to be_an_instance_of(Grid)
		expect(game.grid).to be_empty
	end

	it "has two players" do 
		expect(game.players.count).to eq 2
	end

	it "should know whos turn it is starting with player 1" do
	 expect(game.current_player).to eq(p1)
	end

	it "should switch turns after player1 has had a go" do
		game.change_turn
		expect(game.current_player).to eq(p2) 
	end

	it 'let players mark the grid in turns' do 
		expect(p1).to receive(:mark_grid_at).with(0, game.grid)
		expect(p2).to receive(:mark_grid_at).with(1, game.grid)
		game.go(1)
		game.change_turn
		game.go(2)
	end

	it "should know if there is a winner" do
		_win_for_player_one
		expect(game.winner).to eq(p1)
		expect(game.score).to eq(-1)
	end

	it 'should know if it is a draw' do
		_force_draw
		expect(game.score).to eq(0)
		expect(game.winner).to be nil
	end

	it "raises error if someones won" do
		_win_for_player_one
		expect { game.go(7) }.to raise_error "Too late, #{p1.name} won" 
	end

	def _win_for_player_one
		[1,4,2,5,3].each do |plot| 
			game.grid.cells[plot-1].mark_with(game.current_player.mark)
			game.change_turn
		end
	end

	def _force_draw
		[1,5,4,7,3,2,8,6,9].each do |plot| 
			game.grid.cells[plot-1].mark_with(game.current_player.mark)
			game.change_turn
		end
	end

end