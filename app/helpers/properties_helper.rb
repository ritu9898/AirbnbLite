module PropertiesHelper

	def getMin
		min = Property.minimum("cost")
	end

	def getMax
		max = Property.maximum("cost")
	end
end
