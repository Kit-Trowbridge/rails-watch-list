Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
end

# A user can see all the lists
# GET "lists"
# A user can see the details of a given list and its name
# GET "lists/42"
# A user can create a new list
# GET "lists/new"
# POST "lists"
