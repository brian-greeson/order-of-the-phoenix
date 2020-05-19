class SearchController < ApplicationController
  def index
    @results = HarryService.search(params[:house])
  end
end
