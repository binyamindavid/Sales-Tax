require_relative "../../lib/Product"


RSpec.describe Product do
  initial_products = ["1 imported bottle of perfume at 47.50"]
  formatted_products = {qty: 1, name: "Imported bottle of perfume", price: 47.5, imported: true, tax_exempt: false}

  context "parse inputs" do
    subject { Product.new(initial_products).line_items }

    it "should have subject new constractor" do
      expect(subject).to eq(Product.new(initial_products).line_items)
    end

    it "should have correct format as #initial_products" do
      expect(subject).to eq([formatted_products])
    end
  end
end
