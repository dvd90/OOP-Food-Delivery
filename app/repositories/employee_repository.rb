require 'csv'
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @employees = []
    load_csv
    @next_id = @employees.count + 1
  end

  def all
    @employees
  end

  def find(id)
    @employees[id - 1]
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def save
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << Employee.headers
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role ]
      end
    end
  end

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_path, csv_options) do |row|
      @employees << Employee.new(id: row[0].to_i, username: row[1], password: row[2], role: row[3])
    end
  end
end
