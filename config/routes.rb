TaskProject::Application.routes.draw do

  get "feeds/index"

  root :to => 'pages#index'
  
  resources :feeds
  resources :activities
  resources :comments
  
  resources :tasks do
      post :sort, on: :collection
  end
  
  resources :projects do
      post :sort, on: :collection
  end
  
  # post 'tasks/sort' => 'tasks#sort', :as => 'sort_tasks'
  
  post 'tasks/assign' => 'tasks#assign', :as => 'assign_task'
  
  resources :categories
  post "/categories/in_task" => 'categories#create_in_task', :as => "create_in_task"
  
  resources :projects
  
  resources :comments

  get "/logout" => 'logins#destroy', :as => "logout"
  
  get "/login" => 'logins#new', :as => "login"
  post "/login" => 'logins#create', :as => "create_login"
  
  post "/create_user" => 'users#create', :as => "create_user"
  get "/signup" => 'users#new', :as => "signup"
  
  post '/email' => 'emails#create', :as => 'contact'
  get '/email' => 'emails#new', :as => 'email'
  
end
