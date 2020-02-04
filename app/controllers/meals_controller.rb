require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    @view.display(@meal_repository.all)
  end

  def add
    meal = { name: @view.ask_for('Name'), price: @view.ask_for_integer('Price') }
    @meal_repository.add(meal)
  end
end
