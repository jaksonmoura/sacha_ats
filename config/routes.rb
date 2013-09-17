Sacha::Application.routes.draw do
  scope '/sacha' do
    match '/login' => 'sessions#create', via: [:get, :post]
    match '/logout' => 'sessions#destroy', via: [:get, :post]
    resources :technicals

    resources :services

    resources :calls, except: [] do
        get :get_servants, :on => :collection
    end

    get '/calls/:id/saved' => 'calls#saved', as: :saved
    match '/follow/' => 'calls#follow', as: :follow, via: [:get, :post]
    get '/lastcalls' => 'calls#last_calls', as: :last_calls
    get '/calls/:id/close/' => 'calls#close', as: :close
    match '/calls/:id/done/' => 'calls#done', as: :done, via: [:patch, :put]

    root 'welcomes#index'
  end

  
end
