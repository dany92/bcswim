Rails.application.routes.draw do
  get 'surveys/index'

  get 'surveys/new'

  root 'users#home'
  get '/login' => 'sessions#new'
  get 'signup' => 'users#new'
  get 'manage_account' => 'users#index'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/questions' =>  'questions#index'
  get '/new_questions' => 'questions#new'
  post 'questions' => 'questions#create'
  get 'surveys/_form'=> 'survey#new'
  resources :users
  resources :questions do
    collection do
      delete 'destroy_multiple' 
    end
  end
  resources :surveys do
    collection do
      delete 'destroy_multiple' 
    end
    member do
      get 'respond'
      post 'submitResponse' => 'surveys#submitReponse'
    end
  end
end
