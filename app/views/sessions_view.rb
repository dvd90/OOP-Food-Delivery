require_relative "base_view"


class SessionsView < BaseView
  def wrong_credentials
    puts "Wrong credentials, try again"
  end

  def welcome(employee)
    puts "Welcome #{employee.username.capitalize}!"
  end
end
