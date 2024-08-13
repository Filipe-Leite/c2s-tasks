require 'sidekiq/web'

Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'

  get '/tasks', to: 'tasks#index'
  post '/create_task', to: 'tasks#create'
  patch '/edit_task', to: 'tasks#update'
  delete '/delete_task/:id', to: 'tasks#destroy'


  get '/tasks_status', to: 'task_statuses#index'
end
