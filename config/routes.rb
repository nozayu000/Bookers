Rails.application.routes.draw do
 # resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
root :to => 'homes#top'


# root :to => 'books#top'
get 'books' =>'books#index'
post 'books' => 'books#create'
delete 'books/:id' => 'books#destroy'
get 'books/:id' => 'books#show', as: 'book'
get 'books/:id/edit' => 'books#edit', as: 'edit_book'

patch 'books/:id' => 'books#update', as: 'update_book'
put 'books/:id' => 'books#update'

# delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
    
end
