Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  scope '/blog' do
    resources :articles
  end
  root to: 'main#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #match '*path', :to => 'application#not_found', via: [:get, :post]
end
