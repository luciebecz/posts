class PostsController < ApplicationController
  def index
    # GET HTTP VERB
    # get all posts out of the database
    @posts = Post.all #creating an instance variables so view can have access to it from the controller 
    # .all method ALWAYS returns an array 
  end

  def show
    # GET HTTP VERB
    # gets a single post from the database
    @post = Post.find(params[:id]) #find(params[:id]) will return the post with the id you want
  end

  def new
    # GET HTTP VERB
    # shows the form to create a new post
    @post = Post.new
  end

  def create
    # POST HTTP VERB
    # creates a new post record in our database
    
    @post = Post.new(post_params) #calling post_params method
    if @post.save 
      #calling .save on an instance variable to save that to our database
      #if we successfully save a post record
      #we dont need a view here, we will redirect the user to show, or wherever
      # redirect_to "/posts/#{@post.id}"  this is hard code below is rails ruby way 
      redirect_to post_show_path(@post)
    else
      # if it fials to save in the database for some reason
      render :new # show user there was an error and allow them to retry
    end
  end

  def edit
    # GET HTTP VERB 
    # shows the same form that new does, but prefills it with the post data
    # need to grab a post with id out of the database, just like show method
    @post = Post.find(params[:id]) # SQL words: SELECT * FROM posts where post.id = params[:id]
  end

  def update 
    # PUT/PATCH HTTP VERB
    # updating the post record values
    # need to find the format(id) in the database, and update
    @post = Post.find(params[:format])
    if @post.update(post_params)
      redirect_to post_show_path(@post)
    else
      render :edit
    end
  end

  def destroy
    # DELETE HTTP VERB
    # deletes a single post record from our database
    @post = Post.find(params[:format])
    @post.destroy 
    redirect_to root_path
  end

  private #this is where we allow or disallow data from our posts to enter our database. 
    def post_params
      params.require(:post).permit(:title, :author, :body) #allowing only title author and body to be put into database. this is a strong parameter.PARAMS IS ALWAYS A HASH( KEY VALUE PAIR)
    end
end
