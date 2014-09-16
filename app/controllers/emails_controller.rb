class EmailsController < ApplicationController
  

  def new  
  end
  
  def create 
    
    Pony.mail({
      :to => 'heathered@gmail.com',
      :from => 'taskmate.ocs@gmail.com',
      :body => params[:email][:body],
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
