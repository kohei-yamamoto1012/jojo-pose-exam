Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :exams, only: %i[index show]
    resources :check_items, only: %i[index]
    resources :exam_results, only: %i[create show]
  end

	# 動的OGPのために、Twitterクローラーからのアクセス(=UserAgentにTwitterbotを含む)場合のルーティングを定義
  get '/exam_results/:exam_result_id', to: 'exam_result_shares#show', constraints: { user_agent: /Twitterbot/ }

  get '*path', to: 'home#index', constraints: lambda { |req|
    # active_storageに保存したファイルを参照できるようにするために、
    # 'rails/active_storage'が含まれているurlはリダイレクト対象外にする
    req.path.exclude? 'rails/active_storage'
  }
end
