require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    employee = nil
    while !employee
      username = @view.ask_for("Username")
      pw = @view.ask_for("Password")
      employee = @employee_repository.find_by_username(username)
      if employee
        if employee.password?(pw)
          @view.welcome(employee)
          return employee
        end
      end
      employee = nil
      @view.wrong_credentials
    end
  end
end
