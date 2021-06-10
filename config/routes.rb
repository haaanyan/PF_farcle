Rails.application.routes.draw do
  scope module: 'user' do
    devise_for :users, only: [:sessions, :registrations]
    root :to => 'homes#top'
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :post_images do
      resource :favorites, only: [:create, :destroy, :show]
      resources :post_image_comments, only: [:create, :destroy]
    end

    resources :boards do
      resources :board_comments, only: [:create, :destroy]
    end
  end

end
