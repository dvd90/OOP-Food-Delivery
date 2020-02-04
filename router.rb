class Router
  def initialize(meals_controller, customers_controller, orders_controller, sessions_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.login

    while @running
      if employee.manager?
      else
        #TODO rest of the router
      end
    end
  end

  private

  def print_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. Add an order"
    puts "6. View undelivered orders"
    puts "9. Exit"
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 9 then @running = false
    else puts "Wrong action"
    end
  end

  # def print_manager_menu
  #   puts "1. Add a meal"
  #   puts "2. List available meals"
  #   puts "3. Add a customer"
  #   puts "4. List customers"
  #   puts "5. Add an order"
  #   puts "6. View undelivered orders"
  #   puts "9. Exit"
  # end

  # def route_manager_action(action)
  #   case action
  #   when 1 then @meals_controller.add
  #   when 2 then @meals_controller.list
  #   when 3 then @customers_controller.add
  #   when 4 then @customers_controller.list
  #   when 5 then @orders_controller.add
  #   when 6 then @orders_controller.list_undelivered_orders
  #   when 9 then @running = false
  #   else puts "Wrong action"
  #   end
  # end

  def print_delivery_guy_menu
    puts "1. List my orders"
    puts "2. Mark an order as delivered"
    puts "9. Exit"
  end

  # def route_delivery_guy_action(action)
  #   case action
  #   when 1 then @orders_controller.list_my_orders(@employee)
  #   when 2 then @orders_controller.mark_as_delivered(@employee)
  #   when 9 then @running = false
  #   else puts "Wrong action"
  #   end
  # end

  def ask_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end
end
