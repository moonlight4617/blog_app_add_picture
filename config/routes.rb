Rails.application.routes.draw do
  root 'tops#home'

  # shops
  get 'shops/new', to: 'shops#new', as: 's_new'
  post 'shops/create', to: 'shops#create', as: 's_create'
  get 'shops/edit/:id', to: 'shops#edit', as: 's_edit'
  get 'shops/:id', to: 'shops#show', as: 's_show'
  post 'shops/update/:id', to: 'shops#update', as: 's_update'
  delete 'shops/delete/:id', to: 'shops#destroy', as: 's_delete'
  get 'shops/:id/my_calendar', to: 'shops#my_calendar', as: 'my_calendar'

  # calendar
  get 'shops/:id/reservations/new', to:'reservations#new', as: 'r_new'
  post 'shops/:id/reservations/create', to: 'reservations#create'
  get 'reservations/index', to:'reservations#index', as: 'r_index'
  get 'shops/:id/reservations/show', to: 'reservations#show', as: 'r_show'
  get 'shops/:id/reservations/edit', to: 'reservations#edit', as: 'r_edit'
  post 'shops/:id/reservations/update', to: 'reservations#update', as: 'r_update'
  post 'shops/:id/reservations/delete', to: 'reservations#destroy', as: 'r_delete'
  
  # owners
  get 'owners/new', to: 'owners#new', as: 'o_new'
  post 'owners/create', to: 'owners#create', as: 'o_create'
  get 'owners/show', to: 'owners#show', as: 'o_show'
  get 'owners/edit', to: 'owners#edit', as: 'o_edit'
  patch 'owners/update', to: 'owners#update', as: 'o_update'
  delete 'owners/delete', to: 'owners#destroy', as: 'o_delete'

  # sessions
  get 'user_login', to: 'sessions#new', as: 'u_login'
  post 'user_login', to: 'sessions#create'
  delete 'user_logout', to: 'sessions#destroy', as: 'u_logout'

  get 'owner_login', to: 'sessions#owner_new', as: 'o_login'
  post 'owner_login', to: 'sessions#owner_create'
  delete 'owner_logout', to: 'sessions#owner_destroy', as: 'o_logout'

  # posts
  get 'index', to:'posts#index', as: 'index'
  get 'posts/new', to: 'posts#new', as: 'p_new'
  post 'posts/create', to: 'posts#create', as: 'p_create'
  get 'posts/:id', to: 'posts#show', as: 'p_show'
  get 'posts/:id/edit', to: 'posts#edit', as: 'p_edit'
  patch 'posts/:id/update', to: 'posts#update', as: 'p_update'
  delete 'posts/:id/delete', to: 'posts#destroy', as: 'p_delete'

  # users
  get 'users/new', to:'users#new', as: 'u_new'
  post 'users/create', to: 'users#create'
  get 'users/show', to: 'users#show', as: 'u_show'
  get 'users/edit', to: 'users#edit', as: 'u_edit'
  post 'users/update', to: 'users#update', as: 'u_update'
  post 'users/delete', to: 'users#destroy', as: 'u_delete'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
