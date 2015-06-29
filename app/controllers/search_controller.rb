class SearchController < ApplicationController
	def index
	@q = Profile.search(params[:q])
    @profiles = @q.result(distinct: true)
    end
end
