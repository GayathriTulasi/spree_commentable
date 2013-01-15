Spree::Core::Engine.routes.prepend do

  resources :products do
    resources :comments
  end

  namespace :admin do
    resources :comments do
      collection do
        get  :resource_filter
      end
      member do
        put :change_resource
      end
      get "comments/approve/:id/:flag" => "comments#approve"
    end
  end

  post ":blog_id/:id/comments" => "comments#create",  :as => :post_comments
end
