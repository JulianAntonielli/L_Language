class String
	def digit?
		self =~ /[[:digit:]]/ || false
	end
end