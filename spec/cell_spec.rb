require 'cell'

describe Cell do

	let(:cell) 	{ Cell.new 										}
	let(:x)			{ double :x, :display => 'x'	}

	it 'should be empty initially' do
		expect(cell).to be_empty
	end

	it 'can be marked' do
		cell.mark_with(x)
		expect(cell).not_to be_empty
		expect(cell.content).to be x
	end

	it 'cannnot be marked if empty' do
		cell.mark_with(x)
		expect { cell.mark_with(x) }.to raise_error(RuntimeError)
	end

	it 'can be displayed' do
		expect(cell.display).to eq('-')
		cell.mark_with(x)
		expect(cell.display).to eq('x')
	end
	
end