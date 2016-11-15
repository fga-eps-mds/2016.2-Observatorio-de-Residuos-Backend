# All routes of the app
Rails.application.routes.draw do

  post 'sessions/login'     => 'sessions#create'
  post 'users/create'       => 'users#create'
  post 'users/verify_email' => 'users#verify_email'
  post 'users/edit'         => 'users#edit'
  post 'markings/create'    => 'markings#create'
  post 'pevs/create'        => 'pevs#create'
  post 'pevs/edit'          => 'pevs#edit'
  post 'markings/edit'      => 'markings#edit'

  get  'profiles'          => 'profiles#index'
  get  'markings'          => 'markings#index'
  get  'pevs'              => 'pevs#index'
  get  'pev_types'         => 'pev_types#index'
  get  'marking_types'     => 'marking_types#index'
  get  'marking_types/:id' => 'marking_types#find'
  get  'pevs/getonepev'    => 'pevs#getOnePev'
  get  'articles'          => 'articles#index'
  get  'projects'          => 'projects#index'
end
