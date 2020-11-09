Rails.application.routes.draw do

  # 將首頁指定到boards那個html.erb
  root 'boards#index'

  resources :boards

  

end
