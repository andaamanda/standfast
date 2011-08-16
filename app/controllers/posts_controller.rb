class PostsController < ApplicationController
  PER_PAGE = 10
  
  before_filter :authorize, :except => [:index, :show]
  
  def index
    @page = params[:page] ? params[:page].to_i : 1
    @posts = Post.order_by(:created_at, :desc).limit(PER_PAGE+1).skip((@page-1)*PER_PAGE).to_a
    @more = @posts.count == (PER_PAGE+1)
    @posts.pop if @more
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.user = User.find(params[:post][:user_id])

    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully created."
      redirect_to article_path(@post.slug)
    else
      errors = @post.errors.map {|k,v| "#{k} #{v}"}
      flash.now[:error] = "Sorry, #{errors.to_sentence}."
      render 'new'
    end
  end
  
  def show
    @post = Post.where({ 'slug' => params[:slug] }).first
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully updated."
      redirect_to article_path(@post.slug)
    else
      errors = @post.errors.map {|k,v| "#{k} #{v}"}
      flash.now[:error] = "Sorry, #{errors.to_sentence}."
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    flash[:notice] = "Successfully destroyed #{@post.title}."
    @post.destroy
    redirect_to news_path
  end
end
