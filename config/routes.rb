Rails.application.routes.draw do

  resources :color_palette_widgets do
    collection do
      post 'bindUser', 'unbindUser', 'handleColor'
      get 'bindUser', 'unbindUser', 'handleColor'
    end
  end

  resources :associations do
    collection do
      post 'bindUser', 'unbindUser', 'handleText'
      get 'bindUser', 'unbindUser', 'handleText'
    end
  end

  resources :color_bar_library_widgets do
    collection do
      post 'handleColor', 'bindUser', 'unbindUser', 'checkUser', 'addColor', 'retrieveColors'
      get 'handleColor', 'bindUser', 'unbindUser', 'checkUser', 'addColor', 'retrieveColors'
    end
  end

  resources :color_bar_widgets do
    collection do
      post 'handleColor', 'bindUser', 'unbindUser'
      get 'handleColor', 'bindUser', 'unbindUser'
    end
  end

  resources :gradient_widgets do
    collection do
      post 'handleColor', 'unbindUser', 'bindUser'
      get 'handleColor', 'unbindUser', 'bindUser'
    end
  end

  resources :color_scheme_widgets

  resources :user_widgets do
    collection do
      get 'getWidgets', 'toggleHidden'
      post 'getWidgets'
    end
  end

  resources :users do
    collection do
      post 'syncData'
      get 'syncData'
    end
  end

  resources :widgets do
    collection do
      post 'handleColor'
      get 'handleColor'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
