class TweetsController < ApplicationController

	def new
		@user = current_user
		@tweet = Tweet.new
	end

	def create
		paramsToSave = tweet_params
		paramsToSave[:user] = current_user
		@tweet = Tweet.new(paramsToSave)
		if @tweet.save
			redirect_to feed_path
		else
			render "new"
		end


	end

	def edit
		@user = current_user
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		@tweet.update(tweet_params)
		if @tweet.valid?
			redirect_to feed_path
		else
			render "edit"
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to feed_path #correct this to be dynamic
	end



	private
	def tweet_params
		params.require(:tweet).permit(:body)
	end
end
