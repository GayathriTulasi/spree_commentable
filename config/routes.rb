Spree::Core::Engine.routes.draw do

  resources :products do
    resources :comments
  end

  namespace :admin do
    resources :comments
  end

end
