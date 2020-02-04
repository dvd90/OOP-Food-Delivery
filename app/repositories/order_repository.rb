require 'csv'
require_relative "../models/order"

class OrderRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @csv_path = csv_path
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    load_csv
    @next_id = @orders.count + 1
  end

  def all
    @orders
  end

  def find(id)
    @orders[id - 1]
  end

  def add(obj_order)
    obj_order[:id] = @next_id
    obj_order[:meal] = @meal_repository.find(obj_order[:meal_id])
    obj_order[:customer] = @customer_repository.find(obj_order[:customer_id])
    obj_order[:employee] = @employee_repository.find_by_username(obj_order[:username])
    @orders << Order.new(obj_order)
    @next_id += 1
    save
  end

  def save
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << Order.headers
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_path, csv_options) do |row|
      @orders << Order.new(
        id: row[0].to_i,
        delivered: row[1] == "true",
        meal: @meal_repository.find(row[2].to_i),
        employee: @employee_repository.find(row[3].to_i),
        customer: @customer_repository.find(row[4].to_i))
    end
  end
end
