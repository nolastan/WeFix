module RequestsHelper
  def fill_description(request)
    if(request.description.nil?)
      if(request.service_name == 'Other')
        "Help improve this posting"
      else
        request.service_name + ' posted <abbr class="time_ago" title="' + request.requested_datetime + '">July 17, 2008</abbr>.'
      end
    else
      request.description
    end
  end
end
