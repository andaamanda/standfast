class SessionsController < ApplicationController
  before_filter :require_no_person, :only => [:new, :create]
  before_filter :require_person, :only => :destroy

  def login
    sign_out if current_user
    
    Struct.new('Session',:email,:password)
    @session = Struct::Session.new((params[:session][:email] rescue nil), (params[:session][:password] rescue nil))
    @user = User.new
    
    if params[:session].blank?
      #
    elsif user = User.authenticate(@session.email, @session.password)
      sign_in(user)
      flash[:notice] = "Login successful"
      redirect_back_or(root_url({ :protocol => 'http' }))
    else
      flash.now[:error] = "Sorry, we could not authenticate you. Please try again."
      #
    end
  end
  
  def logout
    clear_return_to
    sign_out
    flash[:notice] = "You've succesfully signed out"
    redirect_to root_url({ :protocol => 'http' })
  end
end
