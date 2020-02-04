require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    load_csv
    @next_id = @meals.count + 1
  end

  def all
    @meals
  end

  def find(id)
    @meals[id - 1]
  end

  def add(obj_meal)
    obj_meal[:id] = @next_id
    @meals << Meal.new(obj_meal)
    @next_id += 1
    save
  end

  def save
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << Meal.headers
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_path, csv_options) do |row|
      @meals << Meal.new(id: row[0].to_i, name: row[1], price: row[2].to_i)
    end
  end
end


