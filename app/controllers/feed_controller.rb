class FeedController < ApplicationController
 def userfeed
 	@tweets = current_user.tweets
 	@usersToDisplay = current_user.followees
 	@usersToDisplay.each do |user|
	      @tweets += user.tweets
	end

	 #@tweets = @tweets.order('created_at desc')
	 @tweets = @tweets.sort_by(&:created_at).reverse[0..10]

 end

end
