class HomeController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").where("service_name != 'Other'").order("requested_datetime DESC").limit(7)
  end
  
end
