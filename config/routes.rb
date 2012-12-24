Spree::Core::Engine.routes.prepend do
  scope(:module => "commentable") do

    resources :products do
      resources :comments
    end

    namespace :admin do
      resources :comments
    end


  end
end
