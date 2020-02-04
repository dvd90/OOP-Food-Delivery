require_relative "base_view"

class OrdersView < BaseView
  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.customer.name} - #{order.employee.username} - #{order.meal.name}"
    end
  end

  def display_delivery_guys(delivery_guys)
    delivery_guys.each do |delivery_guy|
      puts "#{delivery_guy.id} - #{delivery_guy.username}"
    end
  end
end
