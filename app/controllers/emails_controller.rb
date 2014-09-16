class EmailsController < ApplicationController
  
  
  def index
    
  end
  
  def new  
    
  end
  
  def create 
    
    binding.pry
    
    Pony.mail({
      :to => 'heathered@gmail.com',
      :from => 'taskmate.ocs@gmail.com',
      :body => 'Derp',
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'taskmate.ocs@gmail.com',
        :password             => 'derpderpderp',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
    
  end
  
  
  
end
