Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :exams, only: %i[index]
    resources :check_items, only: %i[index]
    resources :exam_results, only: %i[create] do
      post 'upload_image', on: :member
    end
  end

  get '*path', to: 'home#index', constraints: lambda { |req|
    # active_storageに保存したファイルを参照できるようにするために、
    # 'rails/active_storage'が含まれているurlはリダイレクト対象外にする
    req.path.exclude? 'rails/active_storage'
  }
end
