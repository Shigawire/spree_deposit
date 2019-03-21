Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :products do
      resources :variants do
        resource :deposit, only: [:show] do
          resources :deposit_positions, except: [:index], shallow: true
        end
      end
    end
  end
end