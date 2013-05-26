Whatshoulditweet::Application.routes.draw do
  resources :users, :only => [:index, :show] do
    collection do
      get :lookup
    end
  end

  root :to => 'users#index'
end
