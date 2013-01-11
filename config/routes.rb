Spree::Core::Engine.routes.prepend do

  resources :products do
    resources :comments
  end

  namespace :admin do
    resources :comments
    get "comments/approve/:id/:flag" => "comments#approve"
    get "comments/full/:num" => "comments#index"
  end

  post ":blog_id/:id/comments" => "comments#create",  :as => :post_comments
end
