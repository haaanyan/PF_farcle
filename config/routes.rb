Rails.application.routes.draw do
  scope module: 'user' do
    devise_for :users, only: %i[sessions registrations]
    root to: 'homes#top'
    resources :users do
      resource :relationships, only: %i[create destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :post_images do
      resource :favorites, only: %i[create destroy show]
      resources :post_image_comments, only: %i[create destroy]
    end

    resources :boards do
      collection do
        get 'search'
      end
      resources :board_comments, only: %i[create destroy]
    end
  end
end
