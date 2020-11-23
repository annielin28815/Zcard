Rails.application.routes.draw do

  # 將首頁指定到boards那個html.erb
  root 'boards#index'

  # 會員登入系統
   resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    # 下行原型：get '/users/sign_up', to: 'registrations#new', as: 'registration'
    get '/sign_up', action: 'new'
  end
  # post '/users', to: 'registrations#create'
  # get '/users/edit', to: 'registrations#edit',as: 'edit_registration'
  # get '/users/edit', to: 'registrations#update',as: 'update_registration'

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end
    # get '/users/sign_in', to: 'sessions#new', as: 'session'
    # post '/login', to: 'sessions#create', as: 'login'
    # delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

    # 14:20
    resources :boards do
      resources :posts, shallow: true
    end

end
