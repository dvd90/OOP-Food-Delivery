require 'csv'
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []
    load_csv
    @next_id = @customers.count + 1
  end

  def all
    @customers
  end

  def find(id)
    @customers[id - 1]
  end

  def add(obj_customer)
    obj_customer[:id] = @next_id
    @customers << Customer.new(obj_customer)
    @next_id += 1
    save
  end

  def save
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << Customer.headers
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_path, csv_options) do |row|
      @customers << Customer.new(id: row[0].to_i, name: row[1], address: row[2])
    end
  end
end
