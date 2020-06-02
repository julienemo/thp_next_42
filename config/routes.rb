Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'sign_in',
               sign_out: 'sign_out',
               registration: 'sign_up'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  resources :users, except: [:create]
  resources :images

  get "/profile" => "profiles#index"
  get "/profile/images" => "profiles#images"
end
