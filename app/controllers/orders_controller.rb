require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list
    @view.display(@order_repository.all)
  end

  def add
    @meals_controller.list
    meal_id = @view.ask_for_integer("Meal id")
    @customers_controller.list
    customer_id = @view.ask_for_integer("customer id")
    username = @view.ask_for('Username')
    @order_repository.add({meal_id: meal_id, customer_id: customer_id, username: username})
  end

  def list_undelivered_orders
    list = @order_repository.all.select { |order| !order.delivered }
    @view.display(list)
  end
end

