Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do 
    resources :status 
      root to: "status#index"
      #get "acceptservice" => "status#acceptservice"
      #get "rejectservice" => "status#rejectservice"
      get "register", to: "status#register"
      get "mainpage", to: "status#mainpage"
      get "requestpage", to: "status#requestpage"
      get "serviceproviderpage", to: "status#serviceproviderpage"
      get "userspage", to: "status#userspage"
      get "servicetypes", to: "status#servicetypes"
      get "citypage", to: "status#citypage"
      get "servicepage", to: "status#servicepage"

      get "servicestatus/:id", to: "status#servicestatus"
      get "acceptservice/:id", to: "status#acceptservice", as: "acceptservice"
      get "rejectservice/:id", to: "status#rejectservice", as: "rejectservice"

      #get :acceptservice
      #get :rejectservice
  end

  resources :users do 
    collection do 
      get 'register'=> 'users#register'
      get 'description'=> 'users#description'
      post 'addDescription'
      get 'viewservices', to: 'users#viewservices'
      get 'banquetpage'=> 'users#banquetpage'
      get 'ceteringpage'=> 'users#ceteringpage'
      get 'decorationpage'=> 'users#decorationpage'
      get 'musicpage'=> 'users#musicpage'
      get 'partyplotpage'=> 'users#partyplotpage'
      get 'viewmore/:id' => 'users#viewmore', as: 'viewmore'
      get 'searchpage' => 'users#searchpage'
      get 'specificeServive' => 'users#specificeServive'
      get 'deleteAccount/:id' => 'users#deleteAccount', as: 'deleteAccount'

    
    end
  end

  get 'sessions/login'
  post 'sessions/create'
  get 'sessions/destroy'

  resources :serviceproviders do 
    collection do 
      get 'viewrespons/:id'=> 'serviceproviders#viewrespons', as: "viewrespons"
      get 'profile/:id' => 'serviceproviders#profile', as: "profile"
      get 'addservices' => 'serviceproviders#addservices'
      get  'showservice/:id' => 'serviceproviders#showservice', as: 'showservice'
      get ':user_id/editservice/:id' => 'serviceproviders#editservice', as: 'editservice'
      patch 'updateservice/:id' => 'serviceproviders#updateservice', as: 'updateservice'
      get  ':user_id/showuserservice/:id' => 'serviceproviders#showuserservice', as: 'showuserservice'
      get 'setting'=>'serviceproviders#setting'
      get 'notification' => 'serviceproviders#notification'
      get 'showNotice/:id' => 'serviceproviders#showNotice', as: 'showNotice'
    end
  end

  resources :booknotifyservices do 
    collection do 
      get 'book' => 'booknotifyservices#book'
    end 
  end

end
