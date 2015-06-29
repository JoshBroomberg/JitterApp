class ProfilesController < ApplicationController


	def index
		#@q = Profile.ransack(params[:q])
		@prof = Profile.ransack(params[:q])
        @profiles = @prof.result(distinct: true)

        @prof2 = User.ransack(params[:q])
        @profiles2 = []
        @prof2.result(distinct: true).each do |user|
        	@profiles2 << user.profile.name
        end
        if @profiles2.length < User.all.count
        	@which = true
        else
        	@which = false
        end

	end

	def search
		 @prof = User.ransack(username_start: params[:phrase])
         @profiles = @prof.result(distinct: true)
         @str = ""
         @profiles.each do |profile|
          @str += profile.username+ ", "
         end
         @str = @str[0..@str.length-3]
         render "return"
         
	end


	def show
		@profile = Profile.find(params[:id])
		@tweets = @profile.user.tweets

	end

	def new
		@profile = Profile.new
	end

	def create
		paramsToSave = profile_params
		paramsToSave[:user] = current_user
		@profile = Profile.new(paramsToSave)
		if @profile.save
			redirect_to feed_path
		else
			render "new"
		end


	end

	private
	def profile_params
		params.require(:profile).permit(:name, :description)
	end
end
