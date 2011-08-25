class ApplicationController < ActionController::Base
  include Clearance::Authentication
  # protect_from_forgery
  
  before_filter :set_quote
  before_filter :set_response_headers
  
  def set_response_headers
    time = (ENV["HTTP_CACHE_LENGTH"] || 0).to_i
    expires_in time, :public => true
  end
  
  def set_quote
    quotes = []
    quotes << ["We reviewed all of the fall protection systems available on the market and found the TRAM system to be lighter, easier to install and cheaper than any other system. It performs in all weather conditions, requires very little maintenance and, most importantly, I found it to be the safest system available.", "A.Y. Bingham - Owner, Bulkmatic Transport USA", "bulkmatic"]
    quotes << ["McLellan Equipment, Inc. had an employee who received all the safty training the company offered but still did not use the safety training to do the right thing. As a 'deep pocket' McLellan Equipment settled out of court at close to one million dollars. If we had installed a TRAM Fall Protection System, I am confident that neither lawsuit nor accident would have happened.", "Scott McLellan - VP, McLellan Equipment, Inc.", "mclellan"]
    quotes << ["The Standfast TRAM is the only system that positively addresses all of the hazards associated with climbing atop cargo tanks, including ascending and descending. The manner in which its use was embraced by out employees is proof of its ingenious design", "Steve Mahoney - Regulatory Manager, Superior Transporation Logistics L.L.C.", "superior"]
    quotes << ["...[TRAM] systems have been in use for approximately two years (in our plants). I am confident that we have provided the best possible solution for our employees in keeping with the commitment we made to a safe workplace.", "Raymond M. Adams - VP Manufacturing, The Euclid Chemical Company", "euclid"]
    quotes << ["...After seeing how easy the TRAM is to use, they quickly became very comfortable with using it. They now climb on our trailers with the ultimate confidence in knowiung there is no risk of falling.", "John Sandusky - Senior Logistics Manager, Ryder", "ryder"]

    quote = quotes[rand(quotes.length)]
    @quote = quote[0]
    @author = quote[1]
    @testimonial_id = quote[2]
  end
  
  # errors
  def render_401
    @title = "401"
    @description = "Sorry, but you must log in to see this content."
    @person_session = PersonSession.new
    
    render '/errors/401.haml', :layout => '/layouts/application', :status => 401
  end
  
  def render_403
    @title = "403"
    @description = "Sorry, but you're unauthorized to see this content."
    
    render 'errors/403.haml', :layout => '/layouts/application', :status => 403
  end
  
  def render_404
    @title = "404"
    @description = "Sorry, but the content you're looking for is unavailable."
    
    render 'errors/404.haml', :layout => '/layouts/application', :status => 404
  end
  
  # login
  def store_location
    if request.get?
      session[:return_to] = "#{request.protocol}#{request.host}#{request.fullpath}"
    end
  end
  
  def deny_access(flash_message=nil)
    store_location
    flash[:error] = "Please log in or join to continue."
    redirect_to(login_url)
  end
  
  private
  
  # # person_sessions
  # def current_person_session
  #   return @current_person_session if defined?(@current_person_session)
  #   @current_person_session = PersonSession.find
  # end
  # 
  # def current_person
  #   return @current_person if defined?(@current_person)
  #   @current_person = current_person_session && current_person_session.person
  # end
  # 
  # def store_location
  #   session[:return_to] = request.request_uri
  # end
  # 
  # def redirect_back_or_default(default)
  #   redirect_to(session[:return_to] || default)
  #   session[:return_to] = nil
  # end
  # 
  # def require_person
  #   unless current_person
  #     store_location
  #     render_401
  #     return false
  #   end
  # end
  # 
  # def require_no_person
  #   if current_person
  #     redirect_to logout_url
  #     return false
  #   end
  # end
  # 
end
