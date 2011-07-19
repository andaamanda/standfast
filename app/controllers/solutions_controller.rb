class SolutionsController < ApplicationController
  def index
    @title = "Solutions"
    @description = "Our award-winning height safety solutions and their applications in various fields."
  end
  
  def tram
    @title = "TRAM"
    @description = "The TRAM is a unique height safety system that is simple to use, provides the operator with full mobility and yet completely prevents the user from falling to another level."
  end
  
  def isotram
    @title = "ISO TRAM"
    @description = "ISO TRAM is a height safety system specifically designed to protect those working on ISO containers."
  end
  
  def windtram
    @title = "Wind TRAM"
    @description = "The TRAM Fall Protection System is now available for OEMs. Solutions for retro fitting existing wind turbines will be available in early April."
  end
  
  def firetram
    @title = "Fire TRAM"
    @description = "Fire TRAM is built on the same technology proven in the field since 2004. Around the world, major organizations rely on Standfast products to protect employees working at height or in dangerous conditions from the consequences of a fall."
  end
  
  def tline
    @title = "T-Line"
    @description = "The world's first twin lifeline system! The ultimate in Fall Protection. The T-Line Safety System is easier to install and safer to use than traditional fall arrest systems."
    quote = ["The T-Line Safety System design provides truly unique advantages in its use and offers fall protection solutions for applications previously not catered for by traditional devices.", "Leigh Dowie - Director, Meridian Safety", 'meridian']
    @quote = quote[0]
    @author = quote[1]
    @testimonial_id = quote[2]
    
  end
  
  def railtram
    @title = "Rail TRAM"
    @description = "The Rail TRAM system consists of a rail, a slider unit and a restraint belt. It is designed specifically for insulated road tankers and permits its operators to safely access and work on the top of the tank."
  end
  
  def custom
    @title = "Custom Engineered Solutions"
    @description = "Standfast's success comes from working alongside organizations in a range of industries to analyze fall hazards - then developing, designing and manufacturing solutions to overcome them."
  end
  
end