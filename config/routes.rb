Myapp::Application.routes.draw do

  resources :disposition_details
  resources :dispositions
  resources :types
  resources :attributes
  resources :mydispositions
  resources :history

# RESOURCE
  resources :roles
  resources :dashboards
  resources :letters
  resources :delegations
  resources :cost_centres
  resources :directorates
  resources :users
    post '/auth' => 'users#auth', foo: 'bar'
    get '/auth' => 'users#auth', foo: 'bar'
  resources :user_activities

# URL
  root to: "sessions#new"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'landing' => 'dashboards#index'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#signup'
  get 'surat' => 'letters#index2'
  get 'histoo' => 'dispositions#history'
  get 'mydis' => 'mydispositions#index'
  get 'home' => 'dashboards#index'
  get 'new_letter_masuk' => 'letters#new'
  get 'new_letter_keluar' => 'letters#new'
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  # get 'my_request' => 'requests#my_index'
  # post 'signup' => 'users#create'


end
