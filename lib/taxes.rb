class Taxes
  attr_reader :line_item

  def initialize(line_item)
    @line_item = line_item
    @price = line_item[:price]
    @qty = line_item[:qty]
    @imported = line_item[:imported]
    @tax_exempt = line_item[:tax_exempt]
    @BASIC_TAX_RATE = 0.10
    @IMPORT_RATE = 0.05
    @ROUND_OFF = 0.05
  end


  def basic_tax
    @tax_exempt ? 0 : ((@BASIC_TAX_RATE * @price) * @qty / @ROUND_OFF).ceil.to_f / 20
  end

  def import_tax
    @imported ? ((@IMPORT_RATE * @price) * @qty / @ROUND_OFF).ceil.to_f / 20 : 0
  end
end
