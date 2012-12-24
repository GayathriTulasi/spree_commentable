Spree::Core::Engine.routes.draw do

  resources :products do
    scope(:module => "commentable") do
      resources :comments
    end
  end

  namespace :admin do
    scope(:module => "commentable") do
      resources :comments
    end
  end
end
