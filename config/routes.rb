AreYouHappy::Application.routes.draw do
  resources :moods, only: [:new, :create, :index]
  resource :quote

  root "moods#new"
end
