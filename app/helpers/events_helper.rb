module EventsHelper

  def events_of_title(user)
    if user.name.last == "s"
      "#{user.name}' Events"
    else
      "#{user.name}'s Events"
    end
  end
end
