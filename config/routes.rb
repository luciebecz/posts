#in routes we put all our URL's here

Rails.application.routes.draw do
  # Rails is an MVC framework. Model, view, control
  #Model - ruby version of a database table
  #view - HTML / ERB code
  #control - pulls a model/models from database and sets instance variables
  #for our view
  root 'posts#index' #index means all of it. equivalent to SELECT * FROM posts. 
                     #goes from post controller to index method
                                          #adding an alias, which is adding a path prefix so that we can create a link
  get 'posts/:id', to: 'posts#show', as: 'post_show' #:id is called a dynamic place holder. 
                                    #so we oculd put localhost:3000/posts/6 and post six will show up on web browser
  get 'post', to: 'posts#new'

  get 'edit_post/:id', to: 'posts#edit', as: 'edit_post'

  post 'posts', to: 'posts#create'

  patch 'post', to: 'posts#update'

  delete 'posts', to: 'posts#destroy'


end 