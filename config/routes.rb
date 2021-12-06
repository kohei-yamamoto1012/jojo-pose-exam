Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :exams, only: %i[index]
    resources :check_items, only: %i[index]
  end

  get '*path', to: 'home#index'
end
