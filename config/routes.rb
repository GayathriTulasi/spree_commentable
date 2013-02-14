Spree::Core::Engine.routes.draw do
  scope(:module => "commentable") do
    resources :products do
      resources :comments
    end

    namespace :admin do
      resources :comments
      get 'comments/:id/approve', to: 'comments#fast_approve', as: :fast_approve
    end
  end
end
