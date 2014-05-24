class RecommendController < ApplicationController
  def index
    #@test_user = User.first
    @result = User.construct_query
  end
end
