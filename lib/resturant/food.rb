class Resturant::Food
  attr_accessor :name, :map, :img, :description
  FOOD = []

  def self.available_resturant
    self.scraper_resturant_site
  end

  def self.scraper_resturant_site
    binding.pry
    doc = Nokogiri::HTML(open('https://www.tripadvisor.co.uk/Restaurants-g659505-Erbil_Erbil_Province.html'))
    # This is an infinite loop!
    self.scraper_resturant_site do |site|
      resturant = Resturant.new
      resturant.name = site.css("a.property_title").text
      resturant.map = site.css("a#restmap").text
      resturant.description = site.css("a.cuisine").text
    end
  end


  def print_resturant
    self.scraper_resturant_site
    Resturant.food.each do |r|
      if r.name
        puts "Name: #{r.name}"
        puts "Map: #{r.map}"
        puts "Description: #{r.description}"
      end
    end
  end
  #food << resturant
  #end
  #food
  #end

end
