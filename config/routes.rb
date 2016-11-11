Rails.application.routes.draw do
  devise_for :users

  resources :messages do
    resources :comments
  end
  root 'messages#index'

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :messages, only: :index
  end
end
