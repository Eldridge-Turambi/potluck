class Potluck
  attr_reader :date,
              :dishes,
              :menu

  def initialize(date)
    @date = date
    @dishes = []
    @menu = Hash.new
  end

  def add_dish(dish_name)
    @dishes << dish_name
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    category_menu_array = Hash.new{ |hash, key| hash[key] = []}
    @dishes.each do |dish|
      category_menu_array[(dish.category.to_s + 's').to_sym] << dish.name
    end

    category_menu_array.each do |key, value|
      category_menu_array[key] = value.sort!
    end

    # category_menu_array = {
    #   :appetizers => (get_all_from_category(:appetizer).map do |dish|
    #     dish.name
    #   end).sort!,
    #   :entres => (get_all_from_category(:entre).map do |dish|
    #     dish.name
    #   end).sort!,
    #   :desserts => (get_all_from_category(:dessert).map do |dish|
    #     dish.name
    #   end).sort!
    #   }
    #   category_menu_array
  end

  def ratio(category)
    number_dishes_for_category = @dishes.count do |dish|
      dish.category == category
    end
    (number_dishes_for_category.to_f / @dishes.length.to_f) * 100
  end
end
