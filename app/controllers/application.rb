# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  #  before_filter :login_required
  before_filter :get_goals
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '690b941458e9fdf24d6c9951f4e21cc0'

  ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
    :datetime_mdY => "%m/%d/%Y",
    :date_time12 => "%m/%d/%Y %I:%M%p",
    :date_time24 => "%m/%d/%Y %H:%M"
  )

  def get_goals
    @goals = Goal.find(:all)
  end 
end
