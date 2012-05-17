module ApplicationHelper
  
  def time_ago(time, options = {})
    # TODO: always pass this a datetime, not a string
    time= time.to_s
    time = Time.zone.parse(time)
    # ---

    options[:class] ||= "time_ago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end
end
