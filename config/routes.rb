Rails.application.routes.draw do
  get 'messages/index'
  root to: "meesages#index"
end
