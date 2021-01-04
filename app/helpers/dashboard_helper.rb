module DashboardHelper

	def fetch_data
    SubCategory.joins(:properties).group('sub_categories.name').count
	end

	def booking_data
	Property.joins(:bookings).group('properties.sub_category_id').count	
	end

end
