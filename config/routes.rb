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
  resources :users, except: [:create] do
    get "/images" => "users#images"
  end
  resources :images do
    post "/comments" => "comments#create"
  end
  resources :comments, except: [:index, :create]

  get "/profile" => "profiles#index"
  get "/profile/images" => "profiles#images"
  get "/profile/comments" => "profiles#comments"
end
