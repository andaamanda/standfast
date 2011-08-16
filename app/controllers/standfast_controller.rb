class StandfastController < ApplicationController
  def index
    @title = "Height Safety Solutions"
    @description = "Standfast is a global height safety solutions company with offices around the world."
    @post = Post.order_by(:created_at, :desc).limit(1).first
  end
  
  def about
    @title = "History & Direction"
    @description = "Standfast was formed in February 1999 with the mission to develop the best height safety products on the world market. Since then, Standfast has proved itself as a company with the capacity and ingenuity to take on the safety challenges faced by the world's largest organizations."
  end  
  
  def support
    @title = "Support"
    @description = "Standfast is committed to providing the highest standards of sales and service with industry-based sales professionals, qualified engineers and training personnel ready to assist you."
  end
  
  def contact
    @title = "Contact"
    @description = "Please contact us with any questions and comments for Standfast USA."
    @errors = {}
    
  end
  
  def testimonials
    @title = "Testimonials"
    @description = "What our clients are saying about our products and their worker's safety."
    @quote = ""
  end

  def installation
    @title = "Installers"
    @description = "Find Standfast product installers and distributors near you."
    @installers = Installer.all

    # @person_session = PersonSession.new
    
  end
  
  def email
    @title = "Email could not be sent"
    @description = "Please correct the errors below to continue."
    
    @name = params["contact-name"]
    @company = params["contact-company"]
    @address = params["contact-address"]
    @city = params["contact-city"]
    @state = params["contact-state"]
    @zip = params["contact-zip"]
    @phone = params["contact-phone"]
    @email = params["contact-email"]
    @enquiry = params["contact-enquiry"]
    
    @errors = {}
    ["name", "company", "address", "city", "state", "zip", "phone", "enquiry"].each do |field|
      @errors.merge!({ field.intern => "Can't be blank" }) if instance_variable_get("@#{field}").blank?
    end
    @errors.merge!({ :email => "Is invalid" }) unless @email =~ /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/
    
    if @errors.blank?
      options = { :name => @name,
                  :company => @company,
                  :address => @address,
                  :city => @city,
                  :state => @state,
                  :zip => @zip,
                  :phone => @phone,
                  :email => @email,
                  :enquiry => @enquiry
                }
      ContactMailer.contact_email(options).deliver
      ContactMailer.verify_email(options).deliver

      redirect_to thanks_path
    else
      render 'contact'
    end
  end
  
  def legal
    @title = "Legal"
    @description = "Legal information."
  end
  
  def gsa
    @title = "GSA"
    @description = "Standfast with the US General Service Administration."
  end
end