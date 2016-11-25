# All routes of the app
Rails.application.routes.draw do

  post 'sessions/login'     => 'sessions#create'
  post 'users/create'       => 'users#create'
  post 'users/verify_email' => 'users#verify_email'
  post 'users/deactivate'   => 'users#deactivate'
  post 'users/edit'         => 'users#edit'
  post 'markings/create'    => 'markings#create'
  post 'pevs/create'        => 'pevs#create'
  post 'pevs/edit'          => 'pevs#edit'
  post 'markings/edit'      => 'markings#edit'
  post 'pevs/increment'     => 'pevs#increment'
  post 'markings/increment' => 'markings#increment'
  post 'file/upload'        => 'markings#image_upload'
  post 'complaints/create'  => 'complaints#create'
  post 'pev_complaints/create' => 'pev_complaints#create'


  get  'profiles'          => 'profiles#index'
  get  'markings'          => 'markings#index'
  get  'pevs'              => 'pevs#index'
  get  'pev_types'         => 'pev_types#index'
  get  'marking_types'     => 'marking_types#index'
  get  'marking_types/:id' => 'marking_types#find'
  get  'pevs/getonepev'    => 'pevs#getOnePev'
  get  'articles'          => 'articles#index'
  get  'projects'          => 'projects#index'
  get  'user/:id/markings' => 'sessions#getMarkings'
  get  'user/:id/pevs'     => 'sessions#getPevs'
  get  'complaints'        => 'complaints#index'
  get  'pev_complaints'    => 'pev_complaints#index'

end
