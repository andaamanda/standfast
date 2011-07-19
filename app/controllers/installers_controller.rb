class InstallersController < ApplicationController
  before_filter :require_person
  
  def index
    @title = "Installers"
    @description = ""
    
    @installers = Installer.all.to_a
  end
  
  def show
    
  end
  
  def new
    
  end
  
  def edit
    
  end
  
  def create
    
  end
end