Rails.application.routes.draw do
  devise_for :users, 	 :controllers => { :registrations => 'users/registrations',:sessions =>'users/sessions' }
 

  root "home#index"
  get 'home' => 'home#index'

  get 'action' => 'admin#action'
  get 'new'    => 'tasks#new'

  get 'tasks/:id' => 'tasks#show', as: :task

  post 'tasks' => 'tasks#create'
  get  'tasks/:id/edit' => 'tasks#edit', as: :task_edit
  
  patch '/tasks/:id' => 'tasks#update'
  delete '/tasks/:id' => 'tasks#destroy'

  get  '/action/tlead'  => 'admin#tlead'
  get  'action/tlead/:id', to: 'admin#assign_user_to_tl', as: :assign_user
  
  patch 'admin/tlead_multiple/:id' => 'admin#tlead_multiple', as: :tlead_multiple
  
  resources :admin do
    collection do
      get :edit_multiple
      put :update_multiple
      put :assign_multiple_user
    end
  end

  resources :teamlead do
    collection do
      put :assign_t_multiple_update
    end
  end

  resources :employee do
    collection do
      put :done_t_multiple_update
    end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
