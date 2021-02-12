require_relative "../../lib/products"

RSpec.describe Products do
  initial_products = ["2 book at 12.49"]

  context "file_data" do
    subject { Products.new(initial_products).line_items }

    it "should have correct format as #initial_products" do
      expect(subject).to eq([{ imported: false, name: "Book", price: 12.49, qty: 2, tax_exempt: true }])
    end

    it "should have subject new constractor" do
      expect(subject).to eq(Products.new(initial_products).line_items)
    end
  end
end
