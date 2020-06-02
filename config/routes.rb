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

  get "/profile" => "profiles#index"
end
