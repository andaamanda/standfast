class PersonSessionsController < ApplicationController
  before_filter :require_no_person, :only => [:new, :create]
  before_filter :require_person, :only => :destroy

  def new
    @person_session = PersonSession.new
  end

  def create
    @person_session = PersonSession.new(params[:person_session])
    if @person_session.save
      redirect_to installers_path
    else
      render :action => "new"
    end
  end

  def destroy
    current_person_session.destroy
    redirect_to root_url
  end
end
