Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'index#index'
  get 'output', to: 'output#index'
  get 'admin', to: 'admin#index'
  post 'admin/cards', to: 'admin#post_card'
  post 'admin/next_turn', to: 'admin#next_turn'
  post 'admin/initialize_game', to: 'admin#initalize_game'
end
