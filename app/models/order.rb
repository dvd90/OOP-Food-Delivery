class Order
  attr_accessor :id, :delivered
  attr_reader :meal, :employee, :customer
  def initialize(attr = {})
    @id = attr[:id]
    @delivered = attr[:delivered] || false
    @meal = attr[:meal]
    @employee = attr[:employee]
    @customer = attr[:customer]
  end

  def self.headers
    ['id', 'delivered', 'meal_id', 'employee_id', 'customer_id']
  end
end
