require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    @view.display(@customer_repository.all)
  end

  def add
    customer = { name: @view.ask_for('Name'), address: @view.ask_for('Adress') }
    @customer_repository.add(customer)
  end
end
