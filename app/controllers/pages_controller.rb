class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:index]
  
end
