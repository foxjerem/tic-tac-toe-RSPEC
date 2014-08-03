class Cell

	attr_reader :content

	def initialize
		@content = nil
	end

	def empty?
		content == nil
	end

	def marked?
		content != nil
	end

	def mark_with(new_content)
		raise 'Cell is already marked' if marked?
		@content = new_content
	end

	def display
		return content if marked?
		'-'
	end

end