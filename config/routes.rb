Sacha::Application.routes.draw do
  scope '/sacha' do
    match '/login' => 'sessions#create', via: [:get, :post]
    match '/logout' => 'sessions#destroy', via: [:get, :post]

    resources :technicals

    resources :calls
    get '/calls/:id/close/' => 'calls#close', as: :close
    get '/list/' => 'calls#index', as: :list
    match '/calls/:id/done/' => 'calls#done', as: :done, via: [:patch, :put]

    root 'welcomes#index'
  end

  
end
