class ContactMailer < ActionMailer::Base
  TO = ENV['MAILER_TO']
  FROM = ENV['MAILER_FROM']
  
  host = if Rails.env == 'production'
    "www.standfastusa.com"
  elsif Rails.env == 'staging'
    "standfast.copyright1984.com"
  else
    "d.standfastusa.com"
  end

  default_url_options[:host] = host
  default :from => FROM
  
  def contact_email(options)
    @name = options[:name]
    @company = options[:company]
    @address = options[:address]
    @city = options[:city]
    @state = options[:state]
    @zip = options[:zip]
    @phone = options[:phone]
    @email = options[:email]
    @enquiry = options[:enquiry]

    @subject = "Email from website"
    
    mail(:to => TO,
         :subject => @subject)
  end
  
  def verify_email(options)
    @name = options[:name]
    @company = options[:company]
    @address = options[:address]
    @city = options[:city]
    @state = options[:state]
    @zip = options[:zip]
    @phone = options[:phone]
    @email = options[:email]
    @enquiry = options[:enquiry]
    
    @subject = "Thanks for the message"
    
    mail(:to => @email,
         :subject => @subject)
  end
end