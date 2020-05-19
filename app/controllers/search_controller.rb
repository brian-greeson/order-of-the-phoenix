class SearchController < ApplicationController
  def index
    @results = HarryService.new.phoenix_house_members(params[:house])
  end
end
