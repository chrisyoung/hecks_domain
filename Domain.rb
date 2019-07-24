require_relative 'lib/domain'

domain(:Pizzeria) do
  aggregate :Pizzas do
    head :Pizza do 
      string_value :name
      string_value :description
      entity(:named_by).as(:Chef)
      list(:toppings).as(:Topping)
    end
    entity(:Chef) { string_value(:name) }
    value_object(:Topping) { string_value(:name) }
  end

  aggregate :Orders do
    head :Order do
      list(:line_items).as(:LineItem)
    end
    value_object :LineItem do
      string_value :pizza_name
      integer_value :quantity
      currency_value :price
      string_value :foo, optional: true
      reference(:pizza).as(Pizzas: :Pizza)
    end
  end
end