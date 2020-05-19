class SearchController < ApplicationController
  def index
    @results = HarryService.new.house_members(params[:house])
  end
end
