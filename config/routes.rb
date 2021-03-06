Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chats, only: %i[index show] do
    resources :messages, only: %i[index create destroy update]
  end
end
