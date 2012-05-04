class HomeController < ApplicationController
  def index
    # @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC").limit(3)
    tr = Taskrabbit::Api.new
    # to get the /tasks
    @tasks = tr.tasks.all
    # fetch the first task
  end
  
end
