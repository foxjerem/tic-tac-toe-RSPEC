require 'game'

describe Game do 

	let(:p1) 		{ double :player, name: 'human', :mark_grid_at => nil			}
	let(:p2) 		{ double :player, name: 'computer', :mark_grid_at => nil	}
	let(:game)	{ Game.new(p1,p2)																					}

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
		game.go(2)
	end

	it "should know if there is a winner" do
		_win_for_player_one
		expect(game.winner).to eq(p1)
	end

	xit "raises error if someones won" do
	_win_for_player_one
	expect(lambda{game.go(7)}).to raise_error "Too late, Bob won" 
	end

	def _win_for_player_one
		[1,4,2,5,3].each{|plot|game.go(plot)}
	end
end