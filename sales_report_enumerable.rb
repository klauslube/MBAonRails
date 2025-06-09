class SalesReport 
  include Enumerable

  def initialize
    @sales = [
      { product: "Notebook", category: "Eletrônicos", amount: 3000 },
      { product: "Celular", category: "Eletrônicos", amount: 1500 },
      { product: "Cadeira", category: "Móveis", amount: 500 },
      { product: "Mesa", category: "Móveis", amount: 1200 },
      { product: "Headphone", category: "Eletrônicos", amount: 300 },
      { product: "Armário", category: "Móveis", amount: 800 }
      ]
  end

  def each(&block)
    @sales.each(&block)
  end

  def total_by_category
    @sales.each_with_object(Hash.new(0)) do |sale, total|
      total[sale[:category]] += sale[:amount]
    end

    # @sales.reduce(Hash.new(0)) do |total, sale|
    #   total[sale[:category]] += sale[:amount]
    #   total
    # end
  end

  def top_sales(n)
    @sales.map {|sale| sale[:amount]}.sort.reverse.first(n)
  end
  
  def grouped_by_category
    @sales.group_by {|sale| sale[:category]}

  end

  def above_average_sales
    total_amount = @sales.sum {|sale| sale[:amount]}
    average_sales_value = total_amount.to_f / @sales.size

    # @sales.select { |sale| sale[:amount] > average_sales_value }

    @sales.lazy.select {|sale| sale[:amount] > average_sales_value}.to_a
  end

end


sales = SalesReport.new

puts sales.each {|sale| puts sale}
puts '------------------------------'

puts sales.total_by_category
puts '------------------------------'

puts sales.top_sales(3)
puts '------------------------------'

puts sales.grouped_by_category
puts '------------------------------'

puts sales.above_average_sales