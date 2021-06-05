Rails.application.routes.draw do
  scope module: 'user' do
    root :to => 'homes#top'
    resources :users do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end


    devise_for :users, only: [:sessions, :registrations]

    resources :post_images do
      resource :favorites, only: [:create, :destroy]
      resources :post_image_comments, only: [:create, :destroy]
    end

    resources :boards do
      resources :board_comments, only: [:create, :destroy]
    end
  end

end
