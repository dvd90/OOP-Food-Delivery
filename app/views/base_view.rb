class BaseView
  def ask_for(label)
    puts "#{label}?"
    print "> "
    gets.chomp
  end

  def ask_for_integer(label)
    puts "#{label}?"
    print "> "
    gets.chomp.to_i
  end
end
