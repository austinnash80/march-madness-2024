Rails.application.routes.draw do
  resources :draft_ranks do
    collection do 
      get 'ranks_review'
      get 'download_csv'

    end
  end
  resources :draft_results do  
    collection do 
      get 'download_csv'
    end
  end
  
  resources :games
  resources :schools do 
    collection do 
      get 'download_csv'
    end
  end


  get 'pages/home_page'
  get 'pages/admin'
  get 'uploads/new'
  post 'uploads/create_school'
  post 'uploads/create_draft_ranks'
  post 'uploads/create_draft_result'
   post 'create_game', to: 'pages#create_game'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home_page"
end
