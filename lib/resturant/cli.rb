require 'pry'
class Resturant::CLI

  def call
    puts "Welcome to the resturant guid in Erbil city"
    menu
    goodbye
  end

  def resturant_list
    @resturant_name = Resturant::Food.available_resturant
    @resturant_name.each.with_index(1) do |res, i|
      puts "#{i}. #{res.name}"
    end
  end

  def menu
    input = nil
    while input !="exit"
      puts "type list or exit"
    input = gets.strip.downcase
    if input.to_i > 0
      item= @operation_system[input.to_i-1]
      puts "#{item.name} - #{item.url}"
      # puts "choose category"
    elsif input == "list"
      resturant_list
    else
      puts "NOT valid, please type one of these: list or choose the nubmer or exit"
    end
  end
  end

  def goodbye
  puts "THANK YOU! SEE YOU SOON"
  end

end
