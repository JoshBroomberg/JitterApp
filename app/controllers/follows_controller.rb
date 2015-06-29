class FollowsController < ApplicationController

	def create
		#paramsUtility = follower_params
		#render paramsUtility.inspect
		@follow = Follow.new(follower_id: current_user.id, followee_id: params[:profile_id])
		if @follow.save
			redirect_to Profile.find(params[:profile_id])
		else
			redirect_to Profile.find(params[:profile_id])
		end


	end

	def destroy
	    @follow = Follow.where(follower_id: current_user.id, followee_id: params[:profile_id])
	    current_user.followees.destroy(current_user.followees.find_by(id: params[:profile_id]))
	    redirect_to Profile.find(params[:profile_id])

		# @follow = Follow.find(params[:id])
		# @follower.destroy
		# 
	end

	private
	def follower_params
		#params.require(:follow).permit("followee_id")
	end
end
