class FavouritesController < ApplicationController

	def add
		# Rails.cache.fetch([cache_key, __method__])
		if Favourite.exists?(property_id:params[:property_id],user_id:current_user.id)


		Favourite.where(property_id:params[:property_id],user_id:current_user.id).delete
		@properties = Favourite.where(user_id: current_user.id)
		else

		Favourite.create(property_id:params[:property_id],user_id:current_user.id)
		@properties = Favourite.where(user_id: current_user.id)
			# redirect_to favourites_index_path
		end
	end

	def index
		@favourites = Favourite.where(user_id: current_user.id)
		# binding.pry
	end

	def destroy
		# binding.pry
		@favourite = Favourite.find_by(property_id:params[:id],user_id:current_user.id)

		@favourite.destroy
		# Favourite.destroy(@favourite.first.id)
		redirect_to favourites_path
	end

	private

	# def fav_params
	# 	params.require(:favourite).permit(:id)
		
	# end

end
