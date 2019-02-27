Rails.application.routes.draw do
  root 'mains#index'
  get 'mains/index'
  get 'sessions/new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :mains do
    collection do
      post :confirm
    end
  end

  resources :users do
    collection do
    end
  end

  resources :sessions do
    collection do
    end
  end

  resources :favorites do
    collection do
    end
  end

end
