class FollowersController < ApplicationController

	def create
		paramsUtility = follower_params
		#render paramsUtility.inspect
		@follower = Follower.new(user: current_user, follower_id: paramsUtility["follower_id"])
		if @follower.save
			redirect_to Profile.find(paramsUtility[:follower_id])
		else
			redirect_to Profile.find(paramsUtility[:follower_id])
		end


	end

	def destroy
		@follower = Follower.find(params[:id])
		@follower.destroy
		redirect_to Profile.find(params["profile_id"])
	end

	private
	def follower_params
		params.require(:follower).permit("follower_id")
	end
end
