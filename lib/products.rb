require_relative "./calculator"

class Products
  attr_accessor :raw_products, :products

  def initialize(raw_products)
    @raw_products = raw_products
    @products = []
  end

  def line_items
    @raw_products.each do |line|
      line = line.split(/\n+|\r+/).reject(&:empty?)
      parse_line(line)
    end
    Calculator.new(products).calculate_tax

    return products
  end

  def parse_line(line)
    product = { qty: item_qty(line),
                name: item_name(line),
                price: item_price(line),
                imported: item_imported(line),
                tax_exempt: item_taxable(line) }
    @products << product
  end

  private

  def item_qty(line)
    item = line.to_s
    qty = item.scan(/[0-9]/).first.to_i
    qty
  end

  def item_name(line)
    item = line.to_s
    stop_at = item.index("at ") - 2
    item[4..stop_at].capitalize
  end

  def item_price(line)
    item = line.to_s
    price = item.scan(/[0-9]+.[0-9]+|[0-9]+/).last.to_f
    item.gsub!(/ at +[0-9]+.[0-9]+| at [0-9]+/, "")
    price
  end

  def item_imported(line)
    item = line.to_s
    imported = item.downcase.include?("imported")
    imported
  end

  def item_taxable(line)
    line = line.to_s
    line.include? "chocolates" or line.include? "headache" or line.include? "book" or line.include? "chocolate"
  end
end
