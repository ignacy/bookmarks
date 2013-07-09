Bookmarks::Application.routes.draw do
  get 'tags/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks
  resources :sites
  get 'search', to: 'searches#index', as: :search
  root to: "bookmarks#index"
end
