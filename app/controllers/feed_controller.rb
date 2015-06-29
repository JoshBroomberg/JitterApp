class FeedController < ApplicationController
 def userfeed
 	@tweets = current_user.tweets
 	@usersToDisplay = current_user.followers
 	@usersToDisplay.each do |user|
	      @tweets += User.find(user.follower_id).tweets
	end

	 #@tweets = @tweets.order('created_at desc')
	 @tweets = @tweets.sort_by(&:created_at).reverse[0..10]

 end

end
