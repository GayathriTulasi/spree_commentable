Spree::Core::Engine.routes.prepend do

  resources :products do
    resources :comments
  end

  namespace :admin do
    resources :comments
  end

end
