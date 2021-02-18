require_relative "./Tax"

class Calculator
  attr_reader :line_items

  def initialize(line_items)
    @line_items = line_items
    @taxes = 0
    @total_amount = 0
    @listing = []
  end

  def calculate_tax
    puts #@line_items
    get_tax_amounts
    print_totals

    return @listing
  end

  def get_tax_amounts
    @line_items.each do |item|
      basic_tax = 0
      import_tax = 0
      total_taxes = 0
      total = 0

      basic_tax = Tax.new(item).basic_tax
      import_tax = Tax.new(item).import_tax

      total_taxes += (basic_tax + import_tax).to_f
      total += (total_taxes + item[:price]).round(2)

      add_to_tax(total_taxes)
      add_to_total(total)

      @listing << "#{item[:qty]} x #{item[:name]} at #{"%.2f" % total}"
    end
    puts @listing
  end

  def add_to_tax(tax)
    total_tax = @taxes += tax
    return total_tax
  end

  def add_to_total(amount)
    total_amount = @total_amount += amount
    return total_amount
  end

  def print_totals
    puts
    puts "---------------------------------------"
    puts "Sales Taxes: #{"%.2f" % @taxes}"
    puts "Total: #{"%.2f" % @total_amount}"
    puts
  end
end
