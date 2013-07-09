Bookmarks::Application.routes.draw do
  get 'tags/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks
  resources :sites
  root to: "bookmarks#index"
end
