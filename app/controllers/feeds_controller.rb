class FeedsController < ApplicationController
  def index
    @feeds = Feed.last(15).reverse  
  end
end
