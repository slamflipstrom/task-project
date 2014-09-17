TaskProject::Application.routes.draw do
  
  root :to => 'pages#index'
  
  resources :tasks do
      post :sort, on: :collection
  end
  
  post 'tasks/sort' => 'tasks#sort', :as => 'sort_tasks'
  
  post 'tasks/assign' => 'tasks#assign', :as => 'assign_task'
  
  resources :categories
  
  resources :projects

  get "/logout" => 'logins#destroy', :as => "logout"
  
  get "/login" => 'logins#new', :as => "login"
  post "/login" => 'logins#create', :as => "create_login"
  
  post "/create_user" => 'users#create', :as => "create_user"
  get "/signup" => 'users#new', :as => "signup"
  
  post '/email' => 'emails#create', :as => 'contact'
  get '/email' => 'emails#new', :as => 'email'
  
end
